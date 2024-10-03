// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget{

  final String taskName;
  final bool completed;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  TodoTile({super.key, required this.taskName, required this.completed, required this.onChanged, required this.deleteFunction});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [SlidableAction(
            onPressed: deleteFunction,
            backgroundColor: Colors.red,
            label: "Delete",
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(4),
          )]
        ),
        child:  Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            Checkbox(value: completed, onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 25.0, 
                fontWeight: FontWeight.w400,
                decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                decorationColor: Colors.red,
                decorationThickness: 3
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}