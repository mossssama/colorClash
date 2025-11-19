import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import 'app_button_widget.dart';

class GameOverBottomSheet extends StatelessWidget{
  int score;
  Function() resetGame;
  Function() returnToHome;
  GameOverBottomSheet({super.key,required this.score,required this.resetGame,required this.returnToHome});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text('GAME OVER', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your Score: ', style: TextStyle(color: Colors.white)),
              Text('$score', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          AppButton(onTap: resetGame, backgroundColor: Colors.red, text: "Play AGAIN", textColor: Colors.white, fontWeight: FontWeight.bold),
          AppButton(onTap: returnToHome, backgroundColor: mediumRedColor, text: "HOME", textColor: Colors.red, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

}