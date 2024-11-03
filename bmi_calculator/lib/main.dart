import 'package:bmi_calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BMI CALCULATOR",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
