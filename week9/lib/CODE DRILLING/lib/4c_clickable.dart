// Problem: 4 buttons, 4 red lines, 4 different mistakes.
// Fix:

import 'package:flutter/material.dart';

void sayHello() {
  print('Hello');
}

void order(String drink) {
  print('One $drink, please');
}

class OrderButtons extends StatelessWidget {
  const OrderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap: sayHello, child: const Text('Say hello')),
        GestureDetector(
          onTap: () => order("Latte"),
          child: const Text('Order a latte'),
        ),
        GestureDetector(
          onTap: () {
            order('mocha');
          },
          child: const Text('Order a mocha'),
        ),
        GestureDetector(
          onTap: () {
            print('Bye');
          },
          child: const Text('Say bye'),
        ),
      ],
    );
  }
}
