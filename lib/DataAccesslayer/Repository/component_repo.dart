import 'dart:convert';

import '../Clients/component_client.dart';
import '../Models/component.dart';

class ComponentRepo {
  ComponentClient client = ComponentClient();

  Future<List<Component>> getComponents($id) async {
    var response = await client.getComponents($id);
    
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Component>((json) => Component.fromMap(json)).toList();
    }
    return [];
  }
}
