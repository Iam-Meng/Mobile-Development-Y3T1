// Problem: someone made it stateful by hand. Now 3 red lines.
// Fix:

import 'package:flutter/material.dart';

class CoffeeOrder extends StatefulWidget {
  const CoffeeOrder({super.key, required this.name, required this.price});

  final String name;
  final double price;

  @override
  State<CoffeeOrder> createState() => _CoffeeOrderState();
}

class _CoffeeOrderState extends State<CoffeeOrder> {
  int cups = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        Text('$cups cups'),
        Text('Total: ${widget.price * cups}'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              cups++;
            });
          },
          child: const Text('+1'),
        ),
      ],
    );
  }
}
