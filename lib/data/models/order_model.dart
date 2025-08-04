import '../../domain/entities/order.dart';

// Model class that extends the domain-level Order entity
class OrderModel extends Order {
  OrderModel({
    required super.id,
    required super.productName,
    required super.amount,
    required super.status,
    required super.imagePath,
  });

  // Converts JSON to OrderModel instance
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      productName: json['productName'],
      amount: json['amount'],
      status: json['status'],
      imagePath: json['imagePath'],
    );
  }

  // Converts OrderModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'amount': amount,
      'status': status,
      'imagePath': imagePath,
    };
  }
}
