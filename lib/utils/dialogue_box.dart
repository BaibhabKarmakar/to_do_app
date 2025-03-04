import 'package:flutter/material.dart';
import 'package:to_do_application/utils/my_button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogueBox({super.key , required this.controller , required this.onSave , required this.onCancel});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Change the radius as needed
      ),
      content : Container(
        height : 120 ,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children : [
            TextField(
              controller : controller,
              decoration : InputDecoration(
                border : OutlineInputBorder(),
                hintText : "Add a new task",
              )
              
            ),
            SizedBox(height : 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                // Save Button
                Padding(
                  padding: const EdgeInsets.only(left : 10 , right : 10),
                  child: MyButton(onPressed: onSave, text: "Save"),
                ),
                // Cancel Button
              Padding(
                padding: const EdgeInsets.only(left : 10 , right : 10),
                child: MyButton(onPressed: onCancel, text: "Cancel"),
              ),
              ]

            )
          ]
        )
       )
    );
  }
}