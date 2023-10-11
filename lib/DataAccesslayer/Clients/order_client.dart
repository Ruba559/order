import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../Constants/api_links.dart';

class OrderClient {
  var client = http.Client();

  OrderClient();

  Future<bool?> storeOrder(details, userId, note, address, lat, long) async {
    var url = Uri.parse(baseUrl + order);
    print('client');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'details': details,
        'user_id': userId,
        'note': note,
        'address': address,
        'lat': lat,
        'long': long,
      }),
    );
print(response.body);
    if (response.statusCode == 201) {
      print('tt');
      return true;
    } else {
      return null;
    }
  }
}
