import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO DO App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    
  }
}