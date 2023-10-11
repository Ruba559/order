import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/Controllers/LocationController.dart';

import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/place.dart';

class PlaceController extends GetxController {
  List<Place> placeItems = [];

  late TextEditingController name;

  BoxClient boxClient = BoxClient();

  final locationController = Get.find<LocationController>();

  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }

  storeCurrentPlace() async {
    if (await locationController.checkLocationServiceEnabled() == true) {
      await locationController.getPosision();
    }

    var placeItem = Place(
      name: name.text,
      lat: locationController.currentPosition!.latitude,
      long: locationController.currentPosition!.longitude,
    );

    placeItems.add(placeItem);

    await syncPlace();
    name.text = '';
    Get.back();
    update();
  }

  Future<void> syncPlace() async {
    await boxClient.addPlace(placeItems);
  }

  Future<void> deletePlace(num lat, num long) async {
    int? itemIndex = getPlaceItemIndex(lat, long);
    placeItems.removeAt(itemIndex!);
    await syncPlace();

    update();
  }

  int? getPlaceItemIndex(lat, long) {
    for (var index = 0; index < placeItems.length; index++) {
      if (placeItems[index].lat == lat && placeItems[index].long == long) {
        return index;
      }
    }
    return null;
  }
}
