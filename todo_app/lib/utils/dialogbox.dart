// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Dialogbox extends StatelessWidget {
  final mycontroller;

  Dialogbox({super.key, required this.mycontroller});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
    
      content: Container(
        height: 120,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter task name"
              ),

            ),

          ],
        ),
      ),
    );
  }
}

