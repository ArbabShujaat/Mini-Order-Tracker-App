import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders(this.repository);

  // Fetches the list of orders from the repository
  Future<List<Order>> call() => repository.getOrders();
}
