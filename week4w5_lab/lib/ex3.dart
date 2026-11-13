import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[100],
              ),
              child: Center(
                child: Text("OOP", style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight(500),
                  decoration: TextDecoration.none,
                ),),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[300],
              ),
              child: Center(
                child: Text("DART", style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight(500),
                  decoration: TextDecoration.none,
                ),),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[500],
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade600,
                  ]
                ),
              ),
              child: Center(
                child: Text("FLUTTER", style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight(500),
                  decoration: TextDecoration.none,
                ),),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
