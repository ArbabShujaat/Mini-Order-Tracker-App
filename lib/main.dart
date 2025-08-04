import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:order_tracker/presentation/pages/splash_screen.dart';

import 'data/datasources/local_data_source.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/useCases/get_orders.dart';
import 'domain/useCases/cancel_order.dart';
import 'presentation/providers/order_provider.dart';

void main() {
  // Set up local data source and repository
  final localDataSource = LocalDataSource();
  final orderRepository = OrderRepositoryImpl(localDataSource);

  // Run the app with state management
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => OrderProvider(
                GetOrders(orderRepository),
                CancelOrder(orderRepository),
              )..loadOrders(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // base layout size for responsiveness
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Order Tracker',
          theme: ThemeData(
            primaryColor: const Color(0xFF031936),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: child,
        );
      },
      child: const SplashScreen(), // initial screen shown on launch
    );
  }
}
