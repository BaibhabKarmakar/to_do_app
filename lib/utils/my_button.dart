import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key , required this.text , required this.onPressed});
  final String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed, color: Colors.grey[800] , child: Text(text , style : TextStyle(color : Colors.grey[200])));
  }
}