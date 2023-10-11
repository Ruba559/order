
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_text_style.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
        padding: const EdgeInsets.symmetric(vertical: 30),
        messageText: Text(
          message,
          style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.lightOrange);
  }

  static void showError(message) {
    Get.rawSnackbar(
       snackPosition: SnackPosition.TOP,
        padding: const EdgeInsets.symmetric(vertical: 30),
        messageText: Text(
          message,
          style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor:Color.fromARGB(255, 231, 64, 52));
  }

  static void showWarning(message) {
    Get.rawSnackbar(
       snackPosition: SnackPosition.TOP,
        padding: const EdgeInsets.symmetric(vertical: 30),
        messageText: Text(
          message,
          style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.veryDarkGrey);
  }
}