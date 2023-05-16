import 'package:flutter/material.dart';
import 'package:ny_times/core/router/router.dart';
import 'package:ny_times/core/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocatorInit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyRouter.router,
      title: 'Most Popular Articles',
    );
  }
}
