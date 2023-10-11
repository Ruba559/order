import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:order/Constants/routes.dart';
import 'package:order/Controllers/LocationController.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../DataAccesslayer/Repository/order_repo.dart';
import '../Views/Widgets/snackbar.dart';
import 'CartController.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  OrderRepo repo = OrderRepo();

  final cartConroller = Get.find<CartController>();
  final locationController = Get.find<LocationController>();
  List<Map<String, dynamic>> cartItems = [];

  void getCartItemsMap() {
    cartItems.clear();
    for (CartItem item in cartConroller.cartItems) {
      cartItems.add({
        "mealId": item.mealId,
        "qty": item.qty,
        "price": item.meal.price,
        "specialOrder": 'u',
      });
    }
  }

  storeOrder() async {
    getCartItemsMap();

    if (await locationController.checkLocationServiceEnabled() == true) {
      await locationController.getPosision();
      if (await repo.storeOrder(
              cartItems,
              1,
              'note',
              'address',
              locationController.currentPosition!.latitude,
              locationController.currentPosition!.longitude) ==
          true) {
        print('lala');
        await cartConroller.deleteCart();
        Get.toNamed(AppRoute.home);
        SnackBars.showSuccess('تم ارسال الطلب');

        sendNotification();
      }
    }
  }

  storeOrderWithPlace(lat, long, address) async {
    getCartItemsMap();

    if (await locationController.checkLocationServiceEnabled() == true) {
      if (await repo.storeOrder(cartItems, 1, 'note', address, lat, long) ==
          true) {
        print('lala');
        await cartConroller.deleteCart();
        Get.toNamed(AppRoute.home);

        SnackBars.showSuccess('تم ارسال الطلب');
      }
    }
  }

  sendNotification() async {
    String? token = await FirebaseMessaging.instance.getToken();
    sendMessage('title', 'message');
    print(token);
  }

  appRequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  sendMessage(title, message) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAA4H93PoY:APA91bHVWhfmmgwt6A2sbU-VUTN2nvKoHeuiChocOSz0djORMH12sDuDtElhnP3RTKqXxPD1JjuGgHwqqfFBld1dl4J-1UetdZ7txMutLhTBvQIfRBtvi7eIpCcfm96aTr1OQrEo5s_g'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "to":
          "eI2mQcyfQkeyggiWMZX0kN:APA91bGLWJYNqnbpJaF6sXN8CPNpZcdU7dK-JKSt-gMQdBw_gZTkQPjJhxszg73mVvdLDZM3px1IRG7BwvBRt9_OWpUmourQTs1B97b82K9cj5k8jPXcxkZho7fOFwUoUuqv3Q7FgjzH",
      "notification": {
        "title": "hi",
        "body": "hi",
        "mutable_content": true,
        "sound": "Tri-tone"
      },
      "data": {
        "url": "<url of media image>",
        "dl": "<deeplink action on tap of notification>"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    super.onInit();
  }

  void whenClickMessageBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('open');

    });
  }

    void whenClickMessageTerminated () async {
   
   RemoteMessage? initialMessage  =   await FirebaseMessaging.instance.getInitialMessage();

      print('open');

    
  }

sendMessageTopic() async {
  await FirebaseMessaging.instance.subscribeToTopic('weather');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAA4H93PoY:APA91bHVWhfmmgwt6A2sbU-VUTN2nvKoHeuiChocOSz0djORMH12sDuDtElhnP3RTKqXxPD1JjuGgHwqqfFBld1dl4J-1UetdZ7txMutLhTBvQIfRBtvi7eIpCcfm96aTr1OQrEo5s_g'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "to":
          "/topics/weather",
      "notification": {
        "title": "hi",
        "body": "hi",
        "mutable_content": true,
        "sound": "Tri-tone"
      },
      "data": {
        "url": "<url of media image>",
        "dl": "<deeplink action on tap of notification>"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
}
  
}
