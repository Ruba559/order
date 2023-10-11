import 'package:get/get.dart';
import 'package:order/Constants/routes.dart';

import '../DataAccesslayer/Clients/box_client.dart';
import '../DataAccesslayer/Models/cart.dart';
import '../DataAccesslayer/Models/meal.dart';
import '../DataAccesslayer/Repository/meal_repo.dart';

class CartController extends GetxController {
  var qty = 1;

  List<CartItem> cartItems = [];
  BoxClient boxClient = BoxClient();

  MealRepo mealRepo = MealRepo();

  late Meal meal;

  late num totalAmount = 0;

  getCart() async {
     getCartItemsFromStorage();
   
    Get.toNamed(AppRoute.cart);
  }

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();
    Cartdata.count = cartItems.length;
  }

  Future<void> addToCart(int mealId) async {
    var cartItemIndex = getCartItemIndex(mealId);
    meal = await mealRepo.getMealById(mealId);
    if (cartItemIndex == null) {
      var cartItem = CartItem(
          mealId: mealId,
          meal: meal,
          qty: qty,
          total: meal.price * qty,
          specialOrder: 'v');
      cartItems.add(cartItem);
      calc();
      //  totalAmount += meal.price * qty;
      await syncCart();
      Cartdata.count = cartItems.length;
      update();
      qty = 1;
    } else {}
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  }

  Future<void> updateItemCartIncreaseQty(int mealId) async {
    print(mealId);
    int? itemIndex = getCartItemIndex(mealId);
    cartItems[itemIndex!].qty = qty;
    await syncCart();

    update();
  }

  int? getCartItemIndex(mealId) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].mealId == mealId) {
        return index;
      }
    }
    return null;
  }

  Future<void> removeFromCart(int mealId) async {
    int? itemIndex = getCartItemIndex(mealId);
    cartItems.removeAt(itemIndex!);
    await syncCart();
    Cartdata.count = cartItems.length;
    calc();
    update();
  }

  Future<void> deleteCart() async {
    cartItems.clear();
    await syncCart();
    Cartdata.count = 0;
    calc();
  }

  Future<void> calc() async {
    totalAmount = 0.0;
    //  netAmount = 0.0;
    for (var item in cartItems) {
      meal = await mealRepo.getMealById(item.mealId);
      totalAmount += meal.price * item.qty;
    }
    //  netAmount = totalAmount - discountAmount;
    update();
  }

  increaseQty() {
    qty += 1;
    update();
  }

  decreaseQty() {
    if (qty > 1) {
      qty -= 1;
      update();
    }
  }
}

class Cartdata {
  static var count = 0;
}
