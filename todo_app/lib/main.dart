// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async{

  await Hive.initFlutter();

  var box = await Hive.openBox("mybox");
  
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