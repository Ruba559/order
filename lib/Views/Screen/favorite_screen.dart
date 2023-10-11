import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/CartController.dart';
import '../../Controllers/FavoriteController.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  CartController cartController = Get.find();
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
                              child: GetBuilder<FavoriteController>(
                                  builder: (controller) => ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.mealsFavorite.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.darkGrey
                                                      .withOpacity(0.5),
                                                  // spreadRadius: 5,
                                                  blurRadius: 4,
                                                  offset: const Offset(2, 6),
                                                ),
                                              ],
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 6),
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: AppColors
                                                                .lightGrey,
                                                            borderRadius:
                                                                raduis50),
                                                    child: ClipRRect(
                                                      child: SizedBox.fromSize(
                                                          child: Image.network(
                                                        controller
                                                            .mealsFavorite[
                                                                index]
                                                            .image,
                                                        height: 70,
                                                        width: 70,
                                                        fit: BoxFit.contain,
                                                      )),
                                                    )),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                        width: 100,
                                                        height: 40,
                                                        child: Text(
                                                          controller
                                                              .mealsFavorite[
                                                                  index]
                                                              .name,
                                                          style: AppTextStyle
                                                              .body
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .veryDarkGrey),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                        )),
                                                    Text(
                                                      controller
                                                          .mealsFavorite[index]
                                                          .price
                                                          .toString(),
                                                      style:
                                                          AppTextStyle.medium,
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        child: const Icon(
                                                            Icons.favorite,
                                                            size: 25,
                                                            color: AppColors
                                                                .orange),
                                                        onTap: () => {
                                                          controller.removeFavorite(
                                                              controller
                                                                  .mealsFavorite[
                                                                      index]
                                                                  .id)
                                                        },
                                                      ),
                                                      const SizedBox(width: 6),
                                                      InkWell(
                                                        child: const Icon(
                                                          Icons
                                                              .add_shopping_cart_outlined,
                                                          size: 25,
                                                        ),
                                                        onTap: () => {
                                                          cartController
                                                              .addToCart(controller
                                                                  .mealsFavorite[
                                                                      index]
                                                                  .id)
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )))
                        ])))));
  }
}
