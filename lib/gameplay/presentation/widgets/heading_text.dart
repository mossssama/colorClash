import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  const HeadingText({super.key, required this.text, required this.fontColor, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize, color: fontColor, fontWeight: FontWeight.bold));
  }
}