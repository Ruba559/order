import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:order/Constants/app_text_style.dart';
import 'package:order/Views/Widgets/home/app_button.dart';
import 'package:order/Views/Widgets/home/qty_box.dart';

import '../../Constants/app_color.dart';
import '../../Controllers/CartController.dart';
import '../../Controllers/FavoriteController.dart';
import '../../Controllers/MealController.dart';
import '../../DataAccesslayer/Models/meal.dart';
import '../Widgets/home/category_box.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key});

  MealController malController = Get.put(MealController());

  CartController cartController = Get.find();
  FavoriteController favoriteController = Get.find();

  Meal meal = Get.arguments;

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
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(alignment: Alignment.topRight, children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: ClipRRect(
                                child: SizedBox.fromSize(
                                    child: Image.network(
                              Get.arguments.image,
                              height: 210.0,
                              width: 130.0,
                              fit: BoxFit.contain,
                            )))),
                        InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 25,
                              color: AppColors.darkGrey,
                            ))
                      ]),
                       QtyBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Get.arguments.name,
                            style: AppTextStyle.medium
                                .copyWith(color: AppColors.veryDarkGrey),
                          ),
                          Text(
                            Get.arguments.price.toString(),
                            style: AppTextStyle.heading
                                .copyWith(color: AppColors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 55,
                        child: GetBuilder<MealController>(
                            builder: (controller) => ListView.builder(
                                itemCount: controller.components.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return CategoryBox(
                                      text: controller.components[index].name,
                                      icon: controller.components[index]
                                                  .deleteable ==
                                              1
                                          ? FontAwesomeIcons.remove
                                          : null,
                                      color: AppColors.lightGrey,
                                      onTap: () => {
                                            // controller.getMealsByCategory(
                                            //     controller
                                            //         .categories[index].id)
                                          });
                                })),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButton(
                            text: 'Add To Cart',
                            color: AppColors.orange,
                            onTap: () =>
                                {cartController.addToCart(Get.arguments.id)},
                          ),
                      GetBuilder<FavoriteController>(
                            builder: (controller) =>  MaterialButton(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            //  onPressed: onPressed,
                            color: AppColors.orange,
                            onPressed: () {
                              favoriteController.addFavorite(Get.arguments.id);
                            },
                            child: favoriteController.favorites.contains(
                                            Get.arguments.id) ? const Icon(
                              Icons.favorite_outlined,
                               color:  AppColors.white,
                              size: 20,)
                              : 
                              const Icon(
                              Icons.favorite_outline_outlined,
                              color:  AppColors.white,
                              size: 20,
                            ),
                          )),
                        ],
                      )
                    ],
                  )),
            )));
  }
}
