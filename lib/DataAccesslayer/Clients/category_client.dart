import 'package:http/http.dart' as http;
import '../../../Constants/api_links.dart';

class CategoryClient {

   
  var client = http.Client();

  CategoryClient();


  Future<dynamic> getCategories() async {

    var response = await client.get(Uri.parse(baseUrl + categories));
   
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

}