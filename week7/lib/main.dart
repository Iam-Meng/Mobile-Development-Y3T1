import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("HELLO")),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amber,
            child: Center(
              child: Text(
                'HI',
                style: TextStyle(
                  fontSize: 50,
                  color: const Color.fromARGB(255, 52, 7, 255),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
