import 'package:get_storage/get_storage.dart';

import '../Models/cart.dart';
import '../Models/place.dart';

class BoxClient {
  final box = GetStorage();

  // Cart Methods
  Future<List<CartItem>> getCartItems() async {
    var cartItems = await box.read('cart_items');
  
    if (cartItems != null && cartItems != "") {
      final data = cartItems.cast<Map<String, dynamic>>();
      return data.map<CartItem>((json) => CartItem.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addToCart(List<CartItem> cartItems) async {
    await box.remove('cart_items');
    var map = cartItems.map((item) => item.toJson());
    await box.write('cart_items', map.toList());
  }

  // Place Methods
  Future<List<Place>> getPlaceItems() async {
    var placeItems = await box.read('place_items');
    if (placeItems != null && placeItems != "") {
      // final data = placeItems.cast<Map<String, dynamic>>();
      return placeItems.map<Place>((json) => Place.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addPlace(List<Place> placeItems) async {
    await box.remove('place_items');
    var map = placeItems.map((item) => item.toJson());
    await box.write('place_items', map.toList());
  }
}
