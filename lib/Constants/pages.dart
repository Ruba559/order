import 'package:get/get.dart';
import 'package:order/Constants/routes.dart';

import '../Views/Screen/Auth/login-screen.dart';
import '../Views/Screen/cart_screen.dart';
import '../Views/Screen/favorite_screen.dart';
import '../Views/Screen/home_screen.dart';
import '../Views/Screen/meal_screen.dart';
import '../Views/Screen/places_screen.dart';

List<GetPage<dynamic>> getPages =[
  // GetPage(
  //     name: AppRoute.Onboarding,
  //     page: () => const Onboarding(),
  //     middlewares: [AuthMiddleWare()]),

  GetPage(name: AppRoute.home, page: () =>  HomeScreen()),
  GetPage(name: AppRoute.meal, page: () =>   MealScreen()),
  GetPage(name: AppRoute.cart, page: () =>   CartScreen()),
  GetPage(name: AppRoute.places, page: () =>   PlacesScreen()),
  GetPage(name: AppRoute.favorite, page: () =>   FavoriteScreen()),
  GetPage(name: AppRoute.login, page: () =>   LoginScreen()),
  
];