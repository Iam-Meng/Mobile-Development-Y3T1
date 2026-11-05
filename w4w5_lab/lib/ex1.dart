import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello my name is Ronan!", style: TextStyle(
            fontSize: 50,
            color: Colors.orange,
          ),),
        ),
      ),
    ),
  );
}
