import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/core/services/http/fake_api.dart';
import 'package:softshop_mobile/core/models/order.dart';

class OrdersViewModel extends BaseViewModel {
  final fakeApi = locator<FakeApi>();

  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void getPendingOrders() {
    _orders = fakeApi.fetchPendingOrder();
    notifyListeners();
  }
}
