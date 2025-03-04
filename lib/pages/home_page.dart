import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_application/data/database.dart';
import 'package:to_do_application/utils/dialogue_box.dart';
import 'package:to_do_application/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // refernce the box : 
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // If this is the first time ever opening the app then create a default data : 
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else {
      // There already exists data : 
      db.loadData();
    }
    super.initState();
  }
  // text controller : 
  final _controller = TextEditingController();
  void checkBoxChanged(bool? value , int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text , false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogueBox(
        controller : _controller,
        onSave: saveNewTask,  
        onCancel : () => Navigator.of(context).pop(),
      );
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : const Color.fromARGB(255, 180, 180, 180),
      appBar : AppBar(
        backgroundColor : Colors.grey[600],
        title : Text("To Do List" , style : TextStyle(color : Colors.white , fontWeight : FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor : Colors.grey[200] , onPressed: createNewTask , child : Text("+" , style: TextStyle(fontSize : 30),) ),
      body : ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder : (ontext , index) {
          return ToDoTile(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1], onChanged: (value) => checkBoxChanged(value , index) , deleteFunction: (context) => deleteTask(index));
        }
      )
    );
  }
}