// Problem: child is red.
// Fix:

// Tip: 
// - You can use if only inside a list of widgets (children: [...]) to conditionally display widgets
// - But here child: expects a single widget....
// - How can we do?

import 'package:flutter/material.dart';

class StockLabel extends StatelessWidget {
  const StockLabel({super.key, required this.inStock});

  final bool inStock;

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: if (inStock) const Text('In stock') else const Text('Sold out'),
      child: inStock? const Text('In stock') : const Text('Sold out'),
    );
  }
}
