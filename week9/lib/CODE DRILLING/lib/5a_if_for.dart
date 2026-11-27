// Problem: 2 red lines in the list.
// Fix:
//
// Inside [ ]:
//   if (ok) A
//   if (ok) A else B
//   for (var x in list) A
// No { } around A: { } makes a Set.

import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.items, required this.isMember});

  final List<String> items;
  final bool isMember;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Your order'),
        for (var item in items) Text(item),

        if (isMember) const Text('Member: -10%'),
      ],
    );
  }
}
