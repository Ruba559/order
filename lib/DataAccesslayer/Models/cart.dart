import 'package:order/DataAccesslayer/Models/meal.dart';

class CartItem {
  int mealId;
  Meal meal;
  int qty;
  num total;
  String? specialOrder;

  CartItem({
    required this.mealId,
    required this.meal,
    required this.qty,
    required this.total,
    required this.specialOrder,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        mealId: json["meal_id"],
        meal: json["meal"],
        qty: json["quantity"],
        total: json['total_price'],
        specialOrder: json["special_order"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "meal_id": mealId,
        "meal": meal,
        "quantity": qty,
        "total_price": total,
        "special_order": specialOrder,
      };
}
