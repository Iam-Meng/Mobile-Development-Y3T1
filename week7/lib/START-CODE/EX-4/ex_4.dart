import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.lightGreen.shade400),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              MyScore(maxScore: 10, title: 'Flutter'),
              MyScore(maxScore: 10, title: 'Dart'),
              MyScore(maxScore: 10, title: 'React'),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyScore extends StatefulWidget {
  final int maxScore;
  final String title;

  const MyScore({super.key, required this.maxScore, required this.title});

  @override
  State<MyScore> createState() => _MyScoreState();
}

class _MyScoreState extends State<MyScore> {
  int currentScore = 0;

  void increment() {
    setState(() {
      if (currentScore < widget.maxScore) {
        currentScore++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (currentScore > 0) {
        currentScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 10,
        children: [
          Text(
            "My score in ${widget.title}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: decrement, icon: Icon(Icons.remove)),
              IconButton(onPressed: increment, icon: Icon(Icons.add)),
            ],
          ),
          Container(
            height: 35,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            // child: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: currentScore == 0
            //         ? Colors.white
            //         : currentScore < widget.maxScore / 4
            //         ? Colors.lightGreen
            //         : currentScore < widget.maxScore / 2
            //         ? Colors.green
            //         : Colors.green.shade900,
            //   ),
            // ),
            
          ),
        ],
      ),
    );
  }
}
