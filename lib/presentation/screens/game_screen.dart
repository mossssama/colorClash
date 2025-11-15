import 'dart:math';

import 'package:demo_app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:progress_bar_countdown/progress_bar_countdown.dart';

import '../widgets/game_card_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  final List<Card> cards = const [
    Card(text: "BLUE", color: Colors.blue), // 0
    Card(text: "GREY", color: Colors.grey), // 1
    Card(text: "GREEN", color: Colors.green), // 2
    Card(text: "PURPLE", color: Colors.purple), // 3
    Card(text: "RED", color: Colors.red), // 4
    Card(text: "BROWN", color: Colors.brown), // 5
    Card(text: "YELLOW", color: Colors.yellow), // 6
    Card(text: "ORANGE", color: Colors.orange), // 7
    Card(text: "PINK", color: Colors.pink), // 8
  ];

  @override
  Widget build(BuildContext context) {
    List<int> generatedValidCards = generateValidCards(); // List of seven
    List<int> generatedInValidCards = generateInValidCards(generatedValidCards); // List of two
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "SCORE: 123",

              /// To BE CHANGED
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.pause, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const ProgressBarCountdown(
                  initialDuration: Duration(minutes: 1, seconds: 12),
                  progressColor: Colors.grey,
                  progressBackgroundColor: Colors.red,
                  countdownDirection: ProgressBarCountdownAlignment.right,
                  autoStart: true,
                  height: 12,
                  hideText: true),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: [
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[0]].color,
                          text: cards[generatedValidCards[0]].text,
                        ),
                        const SizedBox(width: 8),
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[1]].color,
                          text: cards[generatedValidCards[1]].text,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      children: [
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[2]].color,
                          text: cards[generatedValidCards[2]].text,
                        ),
                        const SizedBox(width: 8),
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[3]].color,
                          text: cards[generatedValidCards[3]].text,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      children: [
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[4]].color,
                          text: cards[generatedValidCards[4]].text,
                        ),
                        const SizedBox(width: 8),
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[5]].color,
                          text: cards[generatedValidCards[5]].text,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Row(
                      children: [
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedValidCards[6]].color,
                          text: cards[generatedValidCards[6]].text,
                        ),
                        const SizedBox(width: 8),
                        GameCard(
                          onTap: () {},
                          backgroundColor: cards[generatedInValidCards[0]].color,
                          text: cards[generatedInValidCards[1]].text,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<int> generateValidCards() {
    List<int> previousNumbers = [];
    for (int i = 0; i < 7; i++) {
      int generatedNumber = Random().nextInt(9);
      while (previousNumbers.contains(generatedNumber)) {
        generatedNumber = Random().nextInt(9);
      }
      previousNumbers.add(generatedNumber);
    }
    return previousNumbers;
  }

  List<int> generateInValidCards(List<int> validCards) {
    List<int> initialCards = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    for (int i = 0; i < validCards.length; i++) {
      if (initialCards.contains(validCards[i])) {
        initialCards.remove(validCards[i]);
      }
    }
    return initialCards;
  }
}

class Card {
  final String text;
  final Color color;

  const Card({
    required this.text,
    required this.color,
  });
}
