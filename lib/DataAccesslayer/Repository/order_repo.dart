import '../Clients/order_client.dart';

class OrderRepo {
  OrderClient client = OrderClient();

  Future<bool> storeOrder(details, int userId, String note, String address,
      num lat, num long) async {
    print('repo');
    if (await client.storeOrder(details, userId, note, address, lat, long) ==
        true) { print('t');
      return true;
    } else {
      return false;
    }
  }
}
