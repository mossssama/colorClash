import 'package:flutter/material.dart';
import 'game_card_widget.dart';
import 'game_cards_row.dart';

class GameCardsColumn extends StatelessWidget {
  List<GameCard> gameCards;
  GameCardsColumn({super.key, required this.gameCards});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          GameCardsRow(gameCards: [
            gameCards[0],
            gameCards[1],
          ]),
          const SizedBox(height: 8),
          GameCardsRow(gameCards: [
            gameCards[2],
            gameCards[3],
          ]),
          const SizedBox(height: 8),
          GameCardsRow(
            gameCards: [
              gameCards[4],
              gameCards[5],
            ],
          ),
          const SizedBox(height: 8),
          GameCardsRow(
            gameCards: [
              gameCards[6],
              gameCards[7],
            ],
          ),
        ],
      ),
    );
  }
}