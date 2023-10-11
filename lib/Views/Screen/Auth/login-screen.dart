import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/Constants/app_color.dart';
import 'package:order/Constants/app_text_style.dart';
import 'package:order/Constants/routes.dart';
import 'package:order/Views/Widgets/home/app_button.dart';
import 'package:order/Views/Widgets/home/app_text_form_field.dart';

import '../../../Controllers/AuthController.dart';
import '../../../Controllers/HomeController.dart';
import '../../Widgets/layouts/appbar.dart';
import '../../Widgets/layouts/appdrawar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            body: GetBuilder<AuthController>(
            builder: (controller) =>Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                     key: authController.formstate,
                    child: ListView(children: [
                  const SizedBox(height: 100),
                  const Text(
                    'تسجيل الدخول',
                    style: AppTextStyle.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                   AppTextFormField(
                    controller: controller.email,
                    prefixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(height: 50),
                   AppTextFormField(
                    controller: controller.password,
                    prefixIcon: Icon(Icons.password),
                  ),
                  const SizedBox(height: 100),
                  AppButton(
                    onTap: () => {
                     
        
                      authController.login()

                    },
                    text: 'حفظ',
                    color: AppColors.orange,
                  ),
                  const SizedBox(height: 50),
                    AppButton(
                    onTap: () => {
                     
        
                      authController.signInWithGoogle()

                    },
                    text: 'تسجيل الدخول بواسطة google',
                    color: AppColors.orange,
                  ),
                 
                ]))))));
  }
}
