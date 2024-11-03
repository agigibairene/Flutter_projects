// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToggleBtn extends StatelessWidget{
  late List<bool> isSelected;
  void Function(int)? onPressed;

  ToggleBtn({super.key, required this.isSelected, required this.onPressed});


  @override
  Widget build(BuildContext context){
    return ToggleButtons(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Metric", style: TextStyle(fontSize: 20),),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Imperial", style: TextStyle(fontSize: 20)),
        ),  
      ], 
      isSelected: isSelected,
      onPressed: onPressed,
      fillColor: Colors.deepPurple[500],
      selectedColor: Colors.white,
    );
  }
}