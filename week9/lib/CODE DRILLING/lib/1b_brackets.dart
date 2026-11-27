// Problem: 2 red lines.
// Fix:

import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coffee shop')),
      body: Column(
        children: [
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
          const Text('Latte'),
          const Text('Mocha'),
        ],
      ),
    );
  }
}
