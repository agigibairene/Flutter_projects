// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Addition extends StatelessWidget{
  final IconData iconx;
  String name;
  String value;

  Addition({super.key, required this.iconx, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconx, size: 32),
        SizedBox(height: 10,),
        Text(name, style: TextStyle(color: Colors.grey[600], fontSize: 18),),
        SizedBox(height: 10,),
        Text(value, style: TextStyle( fontSize: 22, fontWeight:FontWeight.bold)),
      ],
    );
    
  }
}