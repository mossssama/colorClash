import 'package:flutter/material.dart';
import 'player_score_column.dart';
import 'versus_widget.dart';

class MultiplayerAppBarTitle extends StatelessWidget {
  const MultiplayerAppBarTitle({
    super.key,
    required this.myName,
    required this.opponentName,
    required this.myScore,
    required this.opponentScore,
  });

  final String myName;
  final String opponentName;
  final int myScore;
  final int opponentScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        PlayerScoreColumn(playerName: myName, playerScore: myScore),
        const VersusWidget(),
        PlayerScoreColumn(playerName: opponentName, playerScore: opponentScore),
      ],
    );
  }
}