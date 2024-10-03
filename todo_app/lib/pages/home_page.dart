// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, unused_field
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialogbox.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
  
}

class _HomePage extends State<HomePage>{

  final editController = TextEditingController();
  
  final _box = Hive.box("mybox");
  TodoDatabase db = TodoDatabase();

  @override
  void initState(){
    if (_box.get("TODO") == null){
      db.initTodoList();
    }
    else{
      db.showData();
    }

    super.initState();
  }


  // Check and uncheck checkboxes
  void clickCheckedBox(bool? value, int index){
    setState(() {
      db.todoList[index][0] = !db.todoList[index][0];
    });
    db.updateDB();
  }
  

  // TO save a new todo
  void saveNewTodo(){
    setState(() {
      db.todoList.add([false, editController.text]);
    });
    editController.clear();
    Navigator.of(context).pop();
    db.updateDB();
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

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDB();
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
      backgroundColor: Colors.purple[100],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add, color: Colors.white, size: 30,),
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskName: db.todoList[index][1], 
            completed: db.todoList[index][0], 
            onChanged: (value) => clickCheckedBox(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }
      ),
    );
  }
}