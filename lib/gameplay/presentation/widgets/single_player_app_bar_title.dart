import 'package:flutter/material.dart';

class SinglePlayerAppBarTitle extends StatelessWidget {
  const SinglePlayerAppBarTitle({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "SCORE: $score",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}