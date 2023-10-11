import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../DataAccesslayer/Models/category.dart';
import '../DataAccesslayer/Models/meal.dart';
import '../DataAccesslayer/Repository/category_repo.dart';
import '../DataAccesslayer/Repository/meal_repo.dart';

class HomeController extends GetxController {
  MealRepo mealRepo = MealRepo();
  CategoryRepo categoryRepo = CategoryRepo();

  List<Category> categories = [];
  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];

  var isLoadingMeals = false.obs;

  late int current = 0;

  @override
  onInit() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        UserData.authUser = false;
        print('User is currently signed out!');
      } else {
        UserData.authUser = true;
        print('User is signed in!');
      }
    });

    LocationPermission per;
    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    fetchData();
    super.onInit();
  }

  fetchData() async {
    categories = await categoryRepo.getCategories();
    isLoadingMeals.value = false;
    meals = await mealRepo.getMeals();

    isLoadingMeals.value = true;
    update();
  }

  getMealsByCategory(int categoryId) async {
    current = categoryId;

    mealsByCategory = meals
        .where((element) => element.categoryId.isEqual(categoryId))
        .toList();

    if (mealsByCategory.isNotEmpty) {
      meals = mealsByCategory;
      update();
    } else {
      meals = await mealRepo.getMeals();
    }

    update();
  }

  getMealsAll() async {
    current = 0;
    meals = await mealRepo.getMeals();
    update();
  }

  logout() async {
    await FirebaseAuth.instance.signOut();

    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
  

  }
}

class UserData {
  static bool authUser = false;
}
