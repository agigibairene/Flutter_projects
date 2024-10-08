// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/intro_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});


  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Ecommerce App",
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => HomePage(),
      },
    );
  }
}