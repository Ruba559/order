import 'package:http/http.dart' as http;
import '../../../Constants/api_links.dart';

class MealClient {


    
  var client = http.Client();

  MealClient();

  Future<dynamic> getMeals() async {
    var response = await http.get(Uri.parse(baseUrl + meals));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }


  Future<dynamic> getMealsByIds(ids) async {
     var response = await client.get(Uri.parse(baseUrl + mealsByIds + "/$ids"));
print('object');  print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

   Future<dynamic> getMealById(id) async {
     var response = await client.get(Uri.parse(baseUrl + mealById + "/$id"));
print('object');  print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
         return null;
    }
  }

  // Future<dynamic> getMealsByCategoryId(categoryId) async {
  //   var response =
  //       await http.get(Uri.parse('$baseUrl$mealsByCategoryLink/$categoryId'));

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "";
  //   }
  // }

  // Future<dynamic> getFeaturedMeals() async {
  //   var response = await http.get(Uri.parse('$baseUrl$featuredMealsLink'));

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "";
  //   }
  // }
}