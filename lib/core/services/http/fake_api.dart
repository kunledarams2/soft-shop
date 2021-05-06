import 'package:softshop_mobile/core/models/order.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class FakeApi {
  List<Order> fetchPendingOrder() {
    List ordersJson = [
      {
        'name': 'Combo Burger',
        'price': 6000,
        'statusCode': 1,
        'quantity': 2,
      },
      {
        'name': 'Aladdin Saladdin',
        'price': 7000,
        'statusCode': 2,
        'quantity': 5,
      },
      {
        'name': 'Milky Mango',
        'price': 6000,
        'statusCode': 3,
        'quantity': 2,
      },
      {
        'name': 'Barika de Akara',
        'price': 6000,
        'statusCode': 0,
        'quantity': 3,
      }
    ];
    List<Order> orders = [];
    ordersJson.forEach(
      (order) => orders.add(
        Order.fromJson(order),
      ),
    );
    return orders;
  }
}
