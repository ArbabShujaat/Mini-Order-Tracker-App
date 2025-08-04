import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/order.dart';
import '../providers/order_provider.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isPending = order.status == 'pending';

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        // Display order image
        leading: Image.asset(
          order.imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported),
        ),
        title: Text(order.productName),
        subtitle: Text(
          'Amount: \$${order.amount.toStringAsFixed(2)}\nStatus: ${order.status}',
        ),
        isThreeLine: true,

        // Show cancel button if the order is pending
        trailing:
            isPending
                ? GestureDetector(
                  onTap: () => _showCancelDialog(context),
                  child: SizedBox(
                    height: 50.h,
                    width: 100.w,
                    child: Row(
                      children: [
                        const Text('Cancel Order'),
                        SizedBox(width: 5.w),
                        const Icon(Icons.cancel, color: Colors.red),
                      ],
                    ),
                  ),
                )
                : const SizedBox(),
      ),
    );
  }

  // Dialog to confirm cancellation
  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Cancel Order'),
            content: const Text('Are you sure you want to cancel this order?'),
            actions: [
              // Close dialog without action
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel', style: TextStyle(color: Colors.black)),
              ),
              // Confirm cancellation and close dialog
              TextButton(
                onPressed: () {
                  context.read<OrderProvider>().cancelOrder(order.id);
                  Navigator.of(context).pop();
                },
                child: Text('Confirm', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }
}
