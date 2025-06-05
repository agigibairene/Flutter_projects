import 'package:flutter/material.dart';
import 'package:weather_flutter_application/screens/weather.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
   
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Weather(),
        debugShowCheckedModeBanner: false,
    );
   }
    
}