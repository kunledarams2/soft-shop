enum OrderStatus { Failed, Ordering, Delivering, Completed }

class Order {
  final String name;
  final int quantity;
  final statusCode;
  final num price;

  Order(this.name, this.quantity, this.statusCode, this.price);

  Order.fromJson(Map json)
      : name = json['name'],
        quantity = json['quantity'],
        price = json['price'],
        statusCode = json['statusCode'];

  Map toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'statusCode': statusCode,
    };
  }
}
