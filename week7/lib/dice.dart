import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage1 = './dice-2/dice-1.png';
const String diceImage2 = './dice-2/dice-2.png';
const String diceImage3 = './dice-2/dice-3.png';
const String diceImage4 = './dice-2/dice-4.png';
const String diceImage5 = './dice-2/dice-5.png';
const String diceImage6 = './dice-2/dice-6.png';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImage2;

  void rollDice() {
    setState(() {
      // Method 1

      // final randomNumber = Random().nextInt(6);
      // if (randomNumber == 1) {
      //   activeDiceImage = diceImage1;
      // } else if (randomNumber == 2) {
      //   activeDiceImage = diceImage2;
      // } else if (randomNumber == 3) {
      //   activeDiceImage = diceImage3;
      // } else if (randomNumber == 4) {
      //   activeDiceImage = diceImage4;
      // } else if (randomNumber == 5) {
      //   activeDiceImage = diceImage5;
      // } else {
      //   activeDiceImage = diceImage6;
      // }

      // Method 2
      final randomNumber = Random().nextInt(6) + 1;
      activeDiceImage = switch (randomNumber) {
        1 => diceImage1,
        2 => diceImage2,
        3 => diceImage3,
        4 => diceImage4,
        5 => diceImage5,
        _ => diceImage6,
      };
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImage, width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);
