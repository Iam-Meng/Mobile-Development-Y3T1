import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            CustomClicked(),
            CustomClicked(),
            CustomClicked(),
            CustomClicked(),
          ],
        ),
      ),
    ),
  ),
);

class CustomClicked extends StatefulWidget {
  const CustomClicked({super.key});

  @override
  State<StatefulWidget> createState() => _ClickedButton();
}

class _ClickedButton extends State<CustomClicked> {
  bool isClicked = false;
  String get textLabel => isClicked ? 'Selected' : 'Not selected';
  Color get textColor => isClicked ? Colors.white : Colors.black;
  Color get bgColor => isClicked ? Colors.blue.shade500 : Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bgColor),
          onPressed: () => {
            setState(() {
              isClicked = !isClicked;
            }),
          },
          child: Center(
            child: Text(textLabel, style: TextStyle(color: textColor)),
          ),
        ),
      ),
    );
  }
}
