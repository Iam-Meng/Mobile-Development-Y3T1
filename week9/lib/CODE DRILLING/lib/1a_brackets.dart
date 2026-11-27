// Problem: body is red.
// Fix:
//
// [ ] = a List:   children: [ ... ]
// { } = a block:  if (...) { },  () { }

import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My notes')),
      body: const Center(child: Text('No notes yet')),
    );
  }
}
