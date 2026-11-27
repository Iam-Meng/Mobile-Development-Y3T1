// Problem: the Like button must add 1 like, but this widget can't change.
//          Make it stateful, by hand (no Ctrl/Cmd+.).
// Fix:
//
// Stateful = something on this screen changes while it is shown.
//
// The fields stay in the widget. In the State, read them with widget.
//   title  ->  widget.title
//
// A value that changes: a variable in the State,
// changed inside setState(() { ... }).

import 'package:flutter/material.dart';

class LikeCounter extends StatefulWidget {
  const LikeCounter({super.key, required this.label});

  final String label;

  @override
  State<LikeCounter> createState() => _LikeCounterState();
}

class _LikeCounterState extends State<LikeCounter> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${widget.label}: $likes likes'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              likes++;
            });
          },
          child: const Text('Like'),
        ),
      ],
    );
  }
}

// class LikeCounter extends StatelessWidget {
//   const LikeCounter({super.key, required this.label});

//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('$label: $likes likes'),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               likes++;
//             });
//           },
//           child: const Text('Like'),
//         ),
//       ],
//     );
//   }
// }
