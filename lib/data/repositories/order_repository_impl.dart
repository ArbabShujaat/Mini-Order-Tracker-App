import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/local_data_source.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl extends OrderRepository {
  final LocalDataSource localDataSource;

  // Constructor to initialize the local data source
  OrderRepositoryImpl(this.localDataSource);

  // Fetches orders from the local data source
  @override
  Future<List<Order>> getOrders() async {
    return await localDataSource.getOrders();
  }

  // Saves the updated list of orders to the local data source
  @override
  Future<void> updateOrders(List<Order> orders) async {
    final models =
        orders.map((order) {
          return OrderModel(
            id: order.id,
            productName: order.productName,
            amount: order.amount,
            status: order.status,
            imagePath: order.imagePath,
          );
        }).toList();

    await localDataSource.saveOrders(models);
  }
}
