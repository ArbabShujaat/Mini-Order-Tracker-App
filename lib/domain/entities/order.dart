class Order {
  final String id;
  final String productName;
  final double amount;
  final String status;
  final String imagePath;

  // Constructor to initialize all fields
  Order({
    required this.id,
    required this.productName,
    required this.amount,
    required this.status,
    required this.imagePath,
  });

  // Returns a copy of the order with updated status
  Order copyWith({String? status}) {
    return Order(
      id: id,
      productName: productName,
      amount: amount,
      status: status ?? this.status,
      imagePath: imagePath,
    );
  }
}
