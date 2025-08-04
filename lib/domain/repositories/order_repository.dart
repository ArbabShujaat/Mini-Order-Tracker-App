import '../entities/order.dart';

// Defines the contract for order-related operations
abstract class OrderRepository {
  // Fetches the list of orders
  Future<List<Order>> getOrders();

  // Updates the orders with a new list
  Future<void> updateOrders(List<Order> orders);
}
