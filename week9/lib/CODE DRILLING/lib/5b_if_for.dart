// Problem: 3 hard-coded buttons.
//          It must be one button per size, from the list.
// Fix:

import 'package:flutter/material.dart';

class SizePicker extends StatelessWidget {
  const SizePicker({super.key, required this.sizes});

  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ElevatedButton(onPressed: () {}, child: const Text('S')),
        // ElevatedButton(onPressed: () {}, child: const Text('M')),
        // ElevatedButton(onPressed: () {}, child: const Text('L')),
        for (String size in sizes) ElevatedButton(onPressed: () {}, child: Text(size)),
      ],
    );
  }
}
