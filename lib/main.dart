import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cars_screen.dart';
import './providers/car_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CarDetails(),
        ),
      ],
      child: MaterialApp(
        title: 'Cars',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CarsScreen(),
      ),
    );
  }
}
