import 'dart:convert';
import 'package:order/DataAccesslayer/Models/category.dart';

import '../Clients/category_client.dart';

class CategoryRepo {
  
   CategoryClient client = CategoryClient();


  Future<List<Category>> getCategories() async {
    var response = await client.getCategories();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Category>((json) => Category.fromMap(json)).toList();
    }
    return [];
  }
}
