// Problem: someone made it stateless by hand. Now 2 red lines.
// Fix:

import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    super.key,
    required this.userName,
    required this.messages,
  });

  final String userName;
  final int messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello $userName!'),
        Text('You have $messages new messages'),
      ],
    );
  }
}
