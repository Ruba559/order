import 'package:get/get.dart';

import '../Controllers/CartController.dart';
import '../Controllers/FavoriteController.dart';
import '../Controllers/LocationController.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(CartController());
    Get.put<FavoriteController>(FavoriteController());
    Get.put<LocationController>(LocationController());
 
  }
}