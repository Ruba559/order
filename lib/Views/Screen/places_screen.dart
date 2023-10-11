import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/app_style.dart';
import '../../Constants/app_text_style.dart';
import '../../Controllers/OrderController.dart';
import '../../Controllers/PlaceController.dart';
import '../Widgets/home/app_button.dart';
import '../Widgets/home/app_text_form_field.dart';
import '../Widgets/layouts/appbar.dart';
import '../Widgets/layouts/appdrawar.dart';

class PlacesScreen extends StatelessWidget {
  PlacesScreen({super.key});

  PlaceController placeController = Get.put(PlaceController());

   OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: AppAppBar(),
            drawer: AppDrawer(),
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.orange,
                onPressed: () => {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: raduis20,
                        ),
                        backgroundColor: AppColors.lightGrey,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: 290,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 40),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'إضافة الموقع الحالي للأماكن المثبتة ',
                                      style: AppTextStyle.body.copyWith(
                                        color: AppColors.veryDarkGrey,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTextFormField(
                                          controller: placeController.name,
                                          hintText: "ادخل اسم الموقع",
                                          autofocus: true,
                                          prefixIcon:
                                              const Icon(Icons.location_city),
                                        ),
                                        AppButton(
                                            color: AppColors.orange,
                                            text: "اضافة الموقع الحالي",
                                            onTap: () => {
                                                  placeController
                                                      .storeCurrentPlace()
                                                }),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      )
                    },
                child: const Icon(Icons.add)),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: GetBuilder<PlaceController>(
                                  builder: (controller) => ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            placeController.placeItems.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                              onTap: () => {
                                                orderController.storeOrderWithPlace( placeController
                                                              .placeItems[index]
                                                              .lat ,placeController
                                                              .placeItems[index]
                                                              .long, placeController
                                                              .placeItems[index].name
                                                      )
                                              },
                                              child: Container(
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
                                                      offset:
                                                          const Offset(2, 6),
                                                    ),
                                                  ],
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 6),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      size: 27,
                                                      color: AppColors
                                                          .veryDarkGrey,
                                                    ),
                                                    SizedBox(
                                                        width: 170,
                                                        child: Text(
                                                          placeController
                                                              .placeItems[index]
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
                                                    InkWell(
                                                      onTap: () => {
                                                        placeController
                                                            .deletePlace(
                                                                placeController
                                                                    .placeItems[
                                                                        index]
                                                                    .lat,
                                                                placeController
                                                                    .placeItems[
                                                                        index]
                                                                    .long)
                                                      },
                                                      child: const Icon(
                                                        Icons.minimize,
                                                        size: 25,
                                                        color: Color.fromARGB(
                                                            255, 199, 67, 67),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                      )))
                        ])))));
  }
}
