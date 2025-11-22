import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1, // Controls the line's thickness
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 8),
        Text("OR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),
        SizedBox(width: 8),
        Expanded(
          child: Divider(
            thickness: 1, // Controls the line's thickness
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}