import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Controllers/CartController.dart';

class QtyBox extends StatelessWidget {
   QtyBox({super.key});

  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
                          decoration: BoxDecoration(
                            borderRadius: raduis20,
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkGrey.withOpacity(0.5),
                                // spreadRadius: 5,
                                blurRadius: 4,
                                offset: const Offset(3, 5),
                              ),
                            ],
                          ),
                          width: 140,
                        
                          padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 10),
                          child: GetBuilder<CartController>(
                                  builder: (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: const Icon(
                                  Icons.add_outlined,
                                  color:AppColors.veryDarkGrey,
                                  size: 20,
                                ),
                                onTap: () {
                                     cartController.increaseQty();
                                },
                              ),
                               Text(
                               cartController.qty.toString(),
                                style: AppTextStyle.body,
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.remove_outlined,
                                  color: AppColors.veryDarkGrey,
                                  size: 20,
                                ),
                                onTap: () {
                                    cartController.decreaseQty();
                                },
                              ),
                            ],
                          )));
  }
}