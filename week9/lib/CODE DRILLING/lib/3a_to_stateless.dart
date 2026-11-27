// Problem: nothing changes on this screen, but it has a State.
//          Make it stateless, by hand (no Ctrl/Cmd+.).
// Fix:
//
// Nothing changes while it is shown -> no State.
//
// Back in the widget:  widget.title  ->  title

import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.title, required this.year});

  final String title;
  final int year;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.title),
          Text('${widget.year}'),
        ],
      ),
    );
  }
}
