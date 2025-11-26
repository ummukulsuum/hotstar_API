import 'package:flutter/material.dart';
import 'package:hotstar_api/controllers/button_controller.dart';
import 'package:hotstar_api/controllers/navbar_controller.dart';
import 'package:hotstar_api/controllers/spark_controller.dart';
import 'package:hotstar_api/views/screens/navigation_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => ButtonController()),
        // ChangeNotifierProvider(create: (_) => MovieProvider(),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBarScreen(),
    );
  }
}
