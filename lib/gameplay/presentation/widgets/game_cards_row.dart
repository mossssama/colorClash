import 'package:flutter/material.dart';

import 'game_card_widget.dart';

class GameCardsRow extends StatelessWidget {
  List<GameCard> gameCards;

  GameCardsRow({super.key, required this.gameCards});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [gameCards[0], const SizedBox(width: 8), gameCards[1]],
      ),
    );
  }
}