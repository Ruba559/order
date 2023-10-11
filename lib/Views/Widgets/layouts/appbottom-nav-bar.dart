import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../../Constants/app_color.dart';

class AppButtomNavBar extends StatelessWidget {
  // GlobalKey<ScaffoldState> scaffoldKey;
  AppButtomNavBar({
    Key? key,

    // required GlobalKey<ScaffoldState> this.scaffoldKey,
  }) : super(key: key);

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite_border_outlined,
    Icons.notifications_none_outlined,
    Icons.settings,
  ];
  //  List  pages = [
  //   Get.toNamed(AppRoute.home),
  //  Get.toNamed(AppRoute.home),
  //   Get.toNamed(AppRoute.cart),
  //  Get.toNamed(AppRoute.home),
  // ];


  @override
  Widget build(BuildContext context) {
      return 
    AnimatedBottomNavigationBar(
        icons: iconList,
        inactiveColor: AppColors.veryDarkGrey,
        activeColor: AppColors.orange,
        activeIndex: 4,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => (),
       
      );
    
  }
}
