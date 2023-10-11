import 'package:order/DataAccesslayer/Models/meal.dart';

class Place {
  String name;
  num  lat;
  num  long;

  Place({
    required this.name,
    required this.lat,
    required this.long,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
         "long": long,
      };
}
