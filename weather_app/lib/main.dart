// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: Weather(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}