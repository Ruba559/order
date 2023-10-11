import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../Views/Widgets/snackbar.dart';

class LocationController extends GetxController {
  late Position? currentPosition;

  getPosision() async {
    LocationPermission per;

    per = await Geolocator.checkPermission();

    if (per == LocationPermission.always) {
      currentPosition = await getLatAndLong();
    }
  }

  Future<Position> getLatAndLong() async {
    return Geolocator.getCurrentPosition().then((value) => value);
  }

 Future<bool>checkLocationServiceEnabled() async {
    bool services;

    services = await Geolocator.isLocationServiceEnabled();

    if (services == false) {
      Get.back();
      SnackBars.showError('يرجى تفعيل الموقع');
      return false;
    } else {
      return true;
    }
  }
}
