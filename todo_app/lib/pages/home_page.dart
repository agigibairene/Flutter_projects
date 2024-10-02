// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialogbox.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
  
}

class _HomePage extends State<HomePage>{

  List todoList = [
    [false, "Flutter"],
    [false, "JavaScript"],
    [false, "React"],
    [false, "Read"]
  ];

  // Check and uncheck checkboxes
  void clickCheckedBox(bool? value, int index){
    setState(() {
      todoList[index][0] = !todoList[index][0];
    });
  }
  final editController = TextEditingController();

  // TO save a new todo
  void saveNewTodo(){
    setState(() {
      todoList.add([false, editController.text]);
    });
    Navigator.of(context).pop();
  }

  // To show dialogbox when floatingActionBtn is clicked to create a new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return Dialogbox(
          mycontroller: editController,
          onCancel: ()=> Navigator.of(context).pop(),
          onSave: saveNewTodo,
        );
      }
    );
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text("TODO APP", style: TextStyle(color: Colors.white),),
        ),
      ),
      backgroundColor: Colors.purple[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add, color: Colors.white, size: 30,),
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return TodoTile(taskName: todoList[index][1], completed: todoList[index][0], onChanged: (value)=>clickCheckedBox(value, index));
        }
      ),
    );
  }
}