import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/first_screen.dart';
import 'package:quiz_app/models/question_provider.dart';
import 'package:quiz_app/screens/question_screen.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context)=>QuestionProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/first": (context)=>FirstScreen(),
        "/question": (context)=>QuestionScreen()
      },
    );    
  }
}