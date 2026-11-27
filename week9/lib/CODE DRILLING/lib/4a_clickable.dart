// Problem: tapping the card does nothing. It must print the city.
//          Ctrl/Cmd+. on Card -> Wrap with widget... -> GestureDetector
// Fix:
//
// onTap wants a function. It doesn't run it now.
//
//   onTap: save                 OK
//   onTap: () { save(); }       OK
//   onTap: () => like(photo)    OK, with an argument
//
//   onTap: save()               NO: runs now, gives void
//   onTap: { save(); }          NO: a Set or a Map, not a function

import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city});

  final String city;

  void printCity() {
    print(city);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: printCity,
      child: Card(
        child: Padding(padding: const EdgeInsets.all(16), child: Text(city)),
      ),
    );
  }
}
