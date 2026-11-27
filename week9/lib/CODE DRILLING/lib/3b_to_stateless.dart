// Problem: one of these two has a State it doesn't need.
//          Which one? Make it stateless.
// Fix:

import 'package:flutter/material.dart';

// class TodoHeader extends StatefulWidget {
//   const TodoHeader({super.key, required this.title});

//   final String title;

//   @override
//   State<TodoHeader> createState() => _TodoHeaderState();
// }

// class _TodoHeaderState extends State<TodoHeader> {
//   @override
//   Widget build(BuildContext context) {
//     return Text(widget.title);
//   }
// }

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});

  final String task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.task),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isDone = !isDone;
            });
          },
          child: Text(isDone ? 'Done' : 'To do'),
        ),
      ],
    );
  }
}
