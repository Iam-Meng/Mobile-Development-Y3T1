import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue[300],
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[500],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text("CADT STUDENTS", style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),),
          ),
        ),
      ),
    ),
  );
}
