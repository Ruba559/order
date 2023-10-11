import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:order/Constants/app_color.dart';
import 'package:order/Constants/routes.dart';
import 'package:order/Views/Widgets/layouts/drawer_list_tile.dart';

import '../../../Constants/app_text_style.dart';
import '../../../Controllers/CartController.dart';
import '../../../Controllers/FavoriteController.dart';
import '../../../Controllers/HomeController.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);
CartController cartController = Get.find();
FavoriteController favoriteController = Get.find();
HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer( backgroundColor: AppColors.white,
      child: ListView(
        children:  [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
            ),
            accountName: Text(
              'Ruba',
              style: AppTextStyle.title,
            ),
            accountEmail: Text(
              '099999999',
              style: AppTextStyle.xsmall,
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
              'assets/images/person.png',
            )),
          ),
          DrawerListTile(
            title: 'الرئيسية',
            iconData: FontAwesomeIcons.house,
            onTap: () {
              Get.toNamed(AppRoute.home);
            },
          ),
         
          DrawerListTile(
            title: 'السلة',
            iconData: FontAwesomeIcons.cartShopping,
            onTap: () {
              cartController.getCart();
            },
          ),
        
          DrawerListTile(
            title: 'المفضلة',
            iconData: FontAwesomeIcons.heart,
            onTap: () {
               favoriteController.getFavoritePage();
            },
          ),
            DrawerListTile(
            title: 'الاماكن المثبتة',
            iconData: Icons.place,
            onTap: () {
              Get.toNamed(AppRoute.places);
            },
          ),
          UserData.authUser == false ?
        
            DrawerListTile(
            title: 'تسجيل الدخول',
            iconData: Icons.login,
            onTap: () {
              Get.toNamed(AppRoute.login);
            },
          ) :
          DrawerListTile(
            title: 'تسجيل الخروج',
            iconData: Icons.login,
            onTap: () {
               Navigator.of(context).pop();
              homeController.logout();
             
            },
          ) 
        ],
      ),
    );
  }
}


