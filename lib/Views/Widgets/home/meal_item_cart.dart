import 'package:flutter/material.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';

class MealItemCart extends StatelessWidget {
  MealItemCart(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.qyt,
      required this.id,
      required this.removeFromCart,
      required this.updateItemCartIncreaseQty,
      });


  final String name;
  final String price;
  final String image;
  final int id;
  final int qyt;

  final Function()? removeFromCart;
  final Function()? updateItemCartIncreaseQty;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 180,
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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        child: Row(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
       
                SizedBox(
                    width: 100,
                    height: 40,
                    child: Text(
                      name,
                      style: AppTextStyle.body
                          .copyWith(color: AppColors.veryDarkGrey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                Text(
                  price,
                  style: AppTextStyle.medium,
                )
              ],
            ),
              InkWell(onTap: 
               removeFromCart
         ,
         child: const Icon(
                        Icons.delete, size: 17, color: AppColors.veryDarkGrey,),)  ,
          ],
        ),
        onTap: () => {},
      ),
    );
  }
}
