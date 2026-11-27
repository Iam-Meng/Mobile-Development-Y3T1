// Problem: the button must switch ON/OFF.
//          Make it stateful with Ctrl/Cmd+., then fix what is still red.
// Fix:

import 'package:flutter/material.dart';

class LampSwitch extends StatefulWidget {
  const LampSwitch({super.key, required this.room});

  final String room;

  @override
  State<LampSwitch> createState() => _LampSwitchState();
}

class _LampSwitchState extends State<LampSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.room),
        Text(isOn ? 'ON' : 'OFF'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isOn = !isOn;
            });
          },
          child: const Text('Switch'),
        ),
      ],
    );
  }
}
