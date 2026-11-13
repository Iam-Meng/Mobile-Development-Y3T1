import 'package:flutter/material.dart';

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disable(Colors.grey);

  final Color color;
  ButtonType(this.color);
}

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text('Custom buttons', style: TextStyle(fontSize: 20)),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            children: [
              MyButton(label: 'Submit ', icon: Icons.check),
              SizedBox(height: 20),
              MyButton(
                label: 'Time',
                icon: Icons.timer,
                type: ButtonType.secondary,
                position: IconPosition.right,
              ),
              SizedBox(height: 20),
              MyButton(
                label: 'Account',
                icon: Icons.account_tree,
                type: ButtonType.disable,
                position: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;
  final IconPosition position;

  const MyButton({
    super.key,
    required this.label,
    required this.icon,
    this.type = ButtonType.primary,
    this.position = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (position == IconPosition.right) ...[
            Text(label, style: TextStyle()),
            SizedBox(width: 20),
            Icon(icon),
          ] else ...[
            Icon(icon),
            SizedBox(width: 20),
            Text(label, style: TextStyle()),
          ],
        ],
      ),
    );
  }
}
