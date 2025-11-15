import 'package:flutter/material.dart';

class RowCounter extends StatelessWidget {
  int count;
  Color counterBackground;
  RowCounter({super.key, required this.count, required this.counterBackground});

  @override
  Widget build(BuildContext context) {
    // print("Build: $index");
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: counterBackground,
        child: Center(
          child: Text(
            "$count",
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}