// Problem: the parent can't know which fruit was tapped.
// Fix:

import 'package:flutter/material.dart';

class FruitButton extends StatelessWidget {
  const FruitButton({super.key, required this.fruit, required this.onSelected});

  final String fruit;
  final void Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        return onSelected(fruit);
      },
      // onPressed: () => onSelected(fruit),
      child: Text(fruit),
    );
  }
}
