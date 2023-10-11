import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/Views/Widgets/home/qty_box.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';
import '../../../Constants/routes.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.onTap});

  final String name;
  final String price;
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:  onTap,
        child: Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGrey.withOpacity(0.5),
            // spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(2, 6),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      padding: const EdgeInsets.all(5),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: AppColors.lightGrey, borderRadius: raduis50),
                child: ClipRRect(
                  child: SizedBox.fromSize(
                      child: Image.network(
                    image,
                    height: 70,
                    width: 70,
                    fit: BoxFit.contain,
                  )),
                )),
        

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 80,
                    child: Text(
                      name,
                      style: AppTextStyle.small,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                Text(
                  price,
                  style: AppTextStyle.xsmall,
                )
              ],
            ),
          ],
        ),
       
      
    ),
      );
  }
}
