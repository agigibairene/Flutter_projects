// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget{
  final String time;
  final String temperature;
  IconData typeIcon;
  CardDetails({super.key, required this.time, required this.temperature, required this.typeIcon});

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4)
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Icon(typeIcon, size: 32),
             SizedBox(height: 10,),
            Text(temperature, style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}