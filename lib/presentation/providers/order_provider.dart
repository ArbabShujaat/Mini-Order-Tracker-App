import 'package:flutter/foundation.dart';
import '../../domain/entities/order.dart';
import '../../domain/useCases/get_orders.dart';
import '../../domain/useCases/cancel_order.dart';

class OrderProvider extends ChangeNotifier {
  final GetOrders getOrdersUseCase;
  final CancelOrder cancelOrderUseCase;

  List<Order> _orders = [];
  String _filter = 'All';

  OrderProvider(this.getOrdersUseCase, this.cancelOrderUseCase);

  // Return orders based on selected filter
  List<Order> get orders {
    if (_filter == 'All') return _orders;
    return _orders
        .where((order) => order.status == _filter.toLowerCase())
        .toList();
  }

  String get filter => _filter;

  // Load orders using the use case
  Future<void> loadOrders() async {
    _orders = await getOrdersUseCase();
    notifyListeners();
  }

  // Cancel order by ID and reload the list
  Future<void> cancelOrder(String id) async {
    await cancelOrderUseCase(id);
    await loadOrders();
  }

  // Change current filter and notify listeners
  void changeFilter(String newFilter) {
    _filter = newFilter;
    notifyListeners();
  }
}
