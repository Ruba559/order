import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Constants/routes.dart';
import '../DataAccesslayer/Models/meal.dart';
import '../DataAccesslayer/Repository/meal_repo.dart';

class FavoriteController extends GetxController {
  static final _box = GetStorage();

  late var favorites = [];

  MealRepo mealRepo = MealRepo();

  List<Meal> mealsFavorite = [];

  static List<dynamic> getFavorites() {
    return _box.read('favorites') ?? [];
  }

  getFavorite() async {
    favorites = _box.read('favorites') ?? [];

    mealsFavorite = await mealRepo.getMealsByIds(jsonEncode(favorites));

    update();
  }

  getFavoritePage() {
    getFavorite();
    Get.toNamed(AppRoute.favorite);
  }

  void addFavorite(mealId) {
    favorites = getFavorites();
    favorites.add(mealId);
    _box.write('favorites', favorites);
    print(favorites);

    update();
  }

  void removeFavorite(mealId) {
    favorites = getFavorites();
    favorites.remove(mealId);
    _box.write('favorites', favorites);
    mealsFavorite.remove(1);
    getFavorite();
    update();
  }
}
