import 'package:flutter/material.dart';

List<String> images = [
  "./assets/bird.jpg",
  "./assets/bird2.jpg",
  "./assets/insect.jpg",
  "./assets/girl.jpg",
  "./assets/man.jpg",
];

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: BodyImage()));

class BodyImage extends StatefulWidget {
  const BodyImage({super.key});

  @override
  State<BodyImage> createState() => _BodyImageState();
}

class _BodyImageState extends State<BodyImage> {
  int imgIndex = 0;

  void prevImg() {
    setState(() {
      imgIndex = (imgIndex - 1) % images.length;
    });
  }

  void nextImg() {
    setState(() {
      imgIndex = (imgIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: prevImg,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImg,
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Image.asset(images[imgIndex], fit: BoxFit.fill),
      ),
    );
  }
}
