import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  // reference the box : 
  final _myBox = Hive.box('mybox');

  // run this method if this is the first time opening this app : 
  void createInitialData() {
    toDoList = [
      ["Do something in your life!", false],
      ["List some work", false],
      ["Use it now!!! and grow up in your life !!!", false],
    ];
  }

  // load the data from the database : 
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the data in the database : 
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}