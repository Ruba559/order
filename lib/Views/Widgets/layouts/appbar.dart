import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/Constants/app_color.dart';
import 'package:order/Constants/app_text_style.dart';
import '../../../Controllers/CartController.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
   AppAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);
 CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 1,
      centerTitle: true,
      title:  Text('Home', style: AppTextStyle.title.copyWith(color: AppColors.veryDarkGrey)),

       leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.format_align_left,
            color:  AppColors.veryDarkGrey,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
              
  ),
          actions: [
       GetBuilder<CartController>(
        builder: (controller) => 
         Stack(children: [
           IconButton(
        onPressed: () {
         cartController.getCart();
        },
        icon: const Icon(Icons.shopping_cart),
        color: AppColors.veryDarkGrey,
      ),
        Cartdata.count ==0 ?  Container() :
                  Positioned(

                    child:  Stack(
                      children: <Widget>[
                         const Icon(
                            Icons.brightness_1,
                            size: 20.0, color: AppColors.orange),
                         Positioned(
                            top: 3.0,
                            right: 4.0,
                            child:  Center(
                              child:  Text(
                               Cartdata.count.toString(),
                                style:  const TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )),

  ],
                    )),
         ],
         )
        )
     
      ],
    );
  }
}
