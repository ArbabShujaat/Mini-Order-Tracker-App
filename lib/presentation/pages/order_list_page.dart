import 'package:flutter/material.dart';
import 'package:order_tracker/presentation/widgets/order_tile.dart'
    show OrderTile;
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);

    return DefaultTabController(
      length: 4, // All, Pending, Completed, Cancelled
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Orders"),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: const Color(0xFF031936),
            labelColor: const Color(0xFF031936),
            onTap: (index) {
              // Update order filter based on selected tab
              final filters = ['All', 'Pending', 'Completed', 'Cancelled'];
              provider.changeFilter(filters[index]);
            },
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),

        // Displays filtered list of orders
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Consumer<OrderProvider>(
            builder: (context, provider, _) {
              final orders = provider.orders;

              if (orders.isEmpty) {
                return const Center(child: Text('No orders found.'));
              }

              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (_, index) => OrderTile(order: orders[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
