import 'package:flutter/material.dart';

class PlayerScoreColumn extends StatelessWidget {
  String playerName;
  int playerScore;
  PlayerScoreColumn({super.key, required this.playerName, required this.playerScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          playerName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          "$playerScore",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}