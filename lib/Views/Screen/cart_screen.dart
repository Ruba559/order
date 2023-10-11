import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/Constants/app_text_style.dart';
import 'package:order/Controllers/OrderController.dart';
import 'package:order/Views/Widgets/home/app_button.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/routes.dart';
import '../../Controllers/CartController.dart';
import '../Widgets/home/meal_item_cart.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';
import '../Widgets/snackbar.dart';


class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  CartController cartController = Get.find();
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: GetBuilder<CartController>(
                            builder: (controller) => ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.cartItems.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return MealItemCart(
                                      name:
                                          controller.cartItems[index].meal.name,
                                      price: controller
                                          .cartItems[index].meal.price
                                          .toString(),
                                      image: controller
                                          .cartItems[index].meal.image,
                                      qyt: controller.cartItems[index].qty,
                                      id: controller.cartItems[index].meal.id,
                                      removeFromCart: () => {
                                        cartController.removeFromCart(
                                            controller.cartItems[index].meal.id)
                                      },
                                      updateItemCartIncreaseQty: () => {
                                        controller.updateItemCartIncreaseQty(
                                            controller.cartItems[index].meal.id)
                                      },
                                    );
                                  },
                                ))),
                    const Divider(
                      thickness: 1,
                      height: 6,
                    ),
                    Container(
                        height: 250,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: GetBuilder<CartController>(
                            builder: (controller) => Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total :',
                                          style: AppTextStyle.body.copyWith(
                                              color: AppColors.veryDarkGrey),
                                        ),
                                        Text(
                                          controller.totalAmount.toString(),
                                          style: AppTextStyle.title,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discount :',
                                          style: AppTextStyle.body.copyWith(
                                              color: AppColors.veryDarkGrey),
                                        ),
                                        const Text(
                                          '10',
                                          style: AppTextStyle.title,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Net :',
                                          style: AppTextStyle.body.copyWith(
                                              color: AppColors.veryDarkGrey),
                                        ),
                                        const Text(
                                          '140',
                                          style: AppTextStyle.title,
                                        ),
                                      ],
                                    ),
                                    AppButton(
                                        text: "Checkout",
                                        onTap: () => { 
                                          FirebaseAuth.instance.currentUser != null?
                                              showModalBottomSheet<void>(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius: raduis20,
                                                ),
                                                backgroundColor:
                                                    AppColors.lightGrey,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                      height: 250,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 50,
                                                          vertical: 40),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              ': إرسال الطلب الى ',
                                                              style:
                                                                  AppTextStyle
                                                                      .title
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .veryDarkGrey,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Column(
                                                              children: [
                                                                AppButton(
                                                                    color: AppColors
                                                                        .orange,
                                                                    text:
                                                                        "الموقع الحالي",
                                                                     onTap: () => {
                                                                        orderController.storeOrder()
                                                                     }
                                                                    
                                                                    ),
                                                                const SizedBox(
                                                                    height: 25),
                                                                InkWell(
                                                                  onTap:
                                                                      () => {
                                                                      Get.toNamed(
                                                        AppRoute.places)
                                                                  },
                                                                  child: Text(
                                                                    'الأماكن المثبتة',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: AppTextStyle
                                                                        .medium
                                                                        .copyWith(
                                                                      color: AppColors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ));
                                                },
                                              ):
                                            Get.toNamed(AppRoute.login)
                                            },
                                        color: AppColors.orange)
                                  ],
                                )))
                  ]),
            ))));
  }
}
