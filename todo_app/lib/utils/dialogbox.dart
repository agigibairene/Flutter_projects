// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/utils/mybutton.dart';

class Dialogbox extends StatelessWidget {

  final mycontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox({super.key, required this.mycontroller, required this.onSave, required this.onCancel});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
    
      content: Container(
        height: 150,
        
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
           
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Mybutton(onPressed: onSave, nameBtn: "Save"),
                const SizedBox(width: 8,),
                Mybutton(onPressed: onCancel, nameBtn: "Cancel")
            ],
           ),
          ],
        ),
      ),
    );
  }
}

