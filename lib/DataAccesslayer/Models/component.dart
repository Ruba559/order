import 'dart:convert';

class Component {
  final int id;
  final String name;
  final int deleteable;
  final int mealId;
  final String createdAt;
 
  Component({
    required this.id,
    required this.name,
    required this.deleteable,
     required this.mealId,
    required this.createdAt,
  });

  factory Component.fromMap(Map<String, dynamic> map) {
    return Component(
        id: map['id'] as int,
        name: map['name'] ?? "",
        deleteable: map['deleteable'] ?? "",
         mealId: map['meal_id'] ?? "" ,
        createdAt: map['created_at'] ?? "",
        );
  }

  factory Component.fromJson(String source) =>
      Component.fromMap(json.decode(source) as Map<String, dynamic>);

}
