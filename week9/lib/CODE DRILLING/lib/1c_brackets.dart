// Problem: it doesn't format.
// Fix:

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Bopha'),
            Row(
              children: [
                const Icon(Icons.star),
                const Text('4.5'),
                const Text('Phnom Penh'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
