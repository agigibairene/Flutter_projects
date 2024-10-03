// ignore_for_file: unused_field
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final box = Hive.box("mybox");

  // Give it an existing todoList when you open app for the first time
  void initTodoList() {
    todoList = [
      [false, "Flutter"],
      [false, "JavaScript"],
      
    ];
  }

  // When you visit app it should fetch existing todoList and display
  void showData() {
    todoList = box.get("TODO");
  }

  // TO update the todoList
  void updateDB() {
    box.put("TODO", todoList);
  }
}