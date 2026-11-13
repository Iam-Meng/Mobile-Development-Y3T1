import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(height: 400, color: Colors.blue[800]),
            Row(
              children: [
                Expanded(child: Container(height: 100, color: Colors.green)),
                Container(height: 100, width: 100, color: Colors.pink[300]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                Container(width: 100, height: 100, color: Colors.amber[600]),
                Container(width: 100, height: 100, color: Colors.amber[600]),
                Container(width: 100, height: 100, color: Colors.amber[600]),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: Container(color: Colors.pink[400])),
          ],
        ),
      ),
    ),
  );
}
