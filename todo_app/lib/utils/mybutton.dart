// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget{
  
  final String nameBtn;
  VoidCallback onPressed;
  

  Mybutton({super.key, required this.onPressed, required this.nameBtn});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.purple,
      textColor: Colors.white,
      child: Text(nameBtn),
    );
    
  }
}