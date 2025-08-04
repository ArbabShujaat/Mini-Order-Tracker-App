import '../repositories/order_repository.dart';

class CancelOrder {
  final OrderRepository repository;

  CancelOrder(this.repository);

  // Cancels the order with the given ID if it's pending
  Future<void> call(String orderId) async {
    final orders = await repository.getOrders();

    final updated =
        orders.map((order) {
          if (order.id == orderId && order.status == 'pending') {
            return order.copyWith(status: 'cancelled');
          }
          return order;
        }).toList();

    await repository.updateOrders(updated);
  }
}
