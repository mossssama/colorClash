import 'package:flutter/material.dart';

const List<CardSpecs> gamePlayCards = [
  CardSpecs(text: "BLUE", color: Colors.blue), // 0
  CardSpecs(text: "GREY", color: Colors.grey), // 1
  CardSpecs(text: "GREEN", color: Colors.green), // 2
  CardSpecs(text: "PURPLE", color: Colors.purple), // 3
  CardSpecs(text: "RED", color: Colors.red), // 4
  CardSpecs(text: "BROWN", color: Colors.brown), // 5
  CardSpecs(text: "YELLOW", color: Colors.yellow), // 6
  CardSpecs(text: "ORANGE", color: Colors.orange), // 7
  CardSpecs(text: "PINK", color: Colors.pink), // 8
];


class CardSpecs {
  final String text;
  final Color color;

  const CardSpecs({
    required this.text,
    required this.color,
  });
}
