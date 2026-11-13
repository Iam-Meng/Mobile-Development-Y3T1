import 'package:flutter/material.dart';

enum Product {
  dart(
    image: 'ex3/dart.png',
    title: 'Dart',
    description: 'the best object language',
  ),
  flutter(
    image: 'ex3/flutter.png',
    title: 'Flutter',
    description: 'the best mobile widget library',
  ),
  firebase(
    image: 'ex3/firebase.png',
    title: 'Firebase',
    description: 'the best cloud database',
  );

  final String image;
  final String title;
  final String description;
  Product({
    required this.image,
    required this.title,
    required this.description,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            "Products",
            style: TextStyle(decoration: TextDecoration.none, fontSize: 16),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [MyCard()]),
        ),
      ),
    ),
  );
}

class MyCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const MyCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset(image, width: 40, height: 40,),
          Text(title, style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 26,
          ),),
        ],
      ),
    );
  }
}
