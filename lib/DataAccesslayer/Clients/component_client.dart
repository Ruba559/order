import 'package:http/http.dart' as http;
import '../../../Constants/api_links.dart';

class ComponentClient {
  var client = http.Client();

  ComponentClient();

  get id => null;

  Future<dynamic> getComponents($id) async {
   print('hi');  print($id.toString());
    var response = await client.get(Uri.parse(baseUrl + components + "/$id"));
    print(baseUrl + components + "/$id");
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
