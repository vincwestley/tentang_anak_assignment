import 'package:flutter/material.dart';
import 'package:flutter_take_home_test/lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Take Home Test',
      initialRoute: routeDashboard,
      onGenerateRoute: generateRoute,
    );
  }
}
