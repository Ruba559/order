import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/Constants/app_color.dart';
import 'package:order/Constants/app_style.dart';
import 'package:order/Constants/app_text_style.dart';
import 'package:order/Constants/routes.dart';
import 'package:order/Views/Widgets/home/meal_item.dart';
import '../../Controllers/HomeController.dart';
import '../Widgets/Shimmers/image_container_shimmer.dart';
import '../Widgets/home/app_text_form_field.dart';
import '../Widgets/home/category_box.dart';
import '../Widgets/home/meals-slider.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appbottom-nav-bar.dart';
import '../Widgets/layouts/appdrawar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
   
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            key: scaffoldKey,
            appBar:  AppAppBar(),
            drawer: AppDrawer(),
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.veryDarkGrey,
                onPressed: () {},
                child: const Icon(Icons.shopping_cart)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:  AppButtomNavBar(),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 220,
                                  child: AppTextFormField(
                                    controller: TextEditingController(),
                                    hintText: "ابحث",
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.small,
                                     prefixIcon: const Icon(Icons.search),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.lightGrey),
                                      borderRadius: raduis20,
                                      color: AppColors.orange,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    child: const Icon(Icons.filter_alt))
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 55,
                              child: GetBuilder<HomeController>(
                                  builder: (controller) => ListView.builder(
                                      itemCount:
                                          homeController.categories.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CategoryBox(
                                            text: controller
                                                .categories[index].name,
                                            icon: Icons.restaurant,
                                            color: controller
                                                        .categories[index].id ==
                                                    controller.current
                                                ? AppColors.orange
                                                : AppColors.lightOrange,
                                            onTap: () => {
                                              controller
                                                        .categories[index].id ==
                                                    controller.current
                                                ? controller.getMealsAll()
                                                 : controller.getMealsByCategory(
                                                      controller
                                                          .categories[index].id)
                                                });
                                      }))),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: GetBuilder<HomeController>(
                                builder: (controller) => homeController
                                        .meals.isNotEmpty
                                    ? MealsSlider(
                                        widgets: [
                                          for (var i = 0;
                                              i < homeController.meals.length;
                                              i++)
                                            Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: <Widget>[
                                                  Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius: raduis20,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColors
                                                              .darkGrey
                                                              .withOpacity(0.5),
                                                          blurRadius: 8,
                                                          offset: const Offset(
                                                              2, 10),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColors
                                                                      .lightGrey,
                                                                  borderRadius:
                                                                      raduis20),
                                                          child: ClipRRect(
                                                            child: SizedBox
                                                                .fromSize(
                                                                    child: Image
                                                                        .network(
                                                              homeController
                                                                  .meals[i]
                                                                  .image,
                                                              height: 160.0,
                                                              width: 220.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            )),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                                width: 160,
                                                                child: Center(
                                                                  child: Text(
                                                                    homeController
                                                                        .meals[
                                                                            i]
                                                                        .name,
                                                                    style: AppTextStyle
                                                                        .body
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.veryDarkGrey),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 1,
                                                                  ),
                                                                )),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                              homeController
                                                                  .meals[i]
                                                                  .price
                                                                  .toString(),
                                                              style:
                                                                  AppTextStyle
                                                                      .heading
                                                                      .copyWith(
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration:
                                                          const BoxDecoration(
                                                              borderRadius:
                                                                  raduis50,
                                                              color: AppColors
                                                                  .orange),
                                                      child: const Icon(
                                                        Icons.expand_more,
                                                        color: AppColors.white,
                                                        size: 35,
                                                      ),
                                                    ),
                                                    onTap: () => Get.toNamed(
                                                        AppRoute.meal,
                                                        arguments:
                                                            homeController
                                                                .meals[i]),
                                                  )
                                                ])
                                        ],
                                        height: 295,
                                      )
                                    : MealsSlider(
                                        widgets: [Container()],
                                        height: 295,
                                      ),
                              )),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              'الاكثر طلباً',
                              style: AppTextStyle.medium,
                            ),
                          ),
                          SizedBox(
                              height: 100,
                              child: GetBuilder<HomeController>(
                                  builder: (controller) => ListView.builder(
                                        itemCount: homeController.meals.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return     MealItem(name:  homeController.meals[index].name, price: homeController.meals[index].price.toString(), image: homeController.meals[index].image, onTap: ()=> Get.toNamed(
                                                        AppRoute.meal,
                                                        arguments:
                                                            homeController
                                                                .meals[index]))
                                                         
                                                    ;
                                        },
                                      )))
                        ],
                      ),
                    )))));
  }
}
