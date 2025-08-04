import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';
import 'dart:convert';

class LocalDataSource {
  static const String ordersKey = 'ORDERS'; // key to store/retrieve orders

  // Fetches orders from shared preferences
  Future<List<OrderModel>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(ordersKey);

    if (jsonString == null) {
      return _getInitialOrders(); // returns default list if not found
    }

    final List decoded = json.decode(jsonString);
    return decoded.map((e) => OrderModel.fromJson(e)).toList();
  }

  // Saves orders to shared preferences
  Future<void> saveOrders(List<OrderModel> orders) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
        orders.map((e) => e.toJson()).toList();
    prefs.setString(ordersKey, json.encode(jsonList));
  }

  // Initial hardcoded orders shown on first app launch
  List<OrderModel> _getInitialOrders() {
    return [
      OrderModel(
        id: '1',
        productName: 'Shirt',
        amount: 20.0,
        status: 'pending',
        imagePath: 'assets/images/shirt.png',
      ),
      OrderModel(
        id: '2',
        productName: 'Pants',
        amount: 35.0,
        status: 'completed',
        imagePath: 'assets/images/pants.png',
      ),
      OrderModel(
        id: '3',
        productName: 'Shoes',
        amount: 50.0,
        status: 'pending',
        imagePath: 'assets/images/shoes.png',
      ),
      OrderModel(
        id: '4',
        productName: 'Watch',
        amount: 70.0,
        status: 'cancelled',
        imagePath: 'assets/images/watch.png',
      ),
      OrderModel(
        id: '5',
        productName: 'Bag',
        amount: 40.0,
        status: 'pending',
        imagePath: 'assets/images/bag.png',
      ),
    ];
  }
}
