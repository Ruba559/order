import 'dart:convert';


class Meal {
  final int id;
  final String name;
  final String desicription;
  final String image;
  final num price;
  final num offer;
  final int categoryId;
  final String createdAt;

  Meal({
    required this.id,
    required this.name,
    required this.desicription,
    required this.price,
    required this.offer,
    required this.categoryId,
    required this.image,
    required this.createdAt,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] as int,
      name: map['name'] ?? "",
      desicription: map['desicription'] ?? "",
      price: map['price'] ?? "",
      offer: map['offer'] ?? "",
      categoryId: map['category_id'] ?? "",
      image: map['image'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}
