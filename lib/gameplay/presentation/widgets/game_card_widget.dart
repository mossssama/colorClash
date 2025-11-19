import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  Color backgroundColor;
  String text;
  Function() onTap;

  GameCard({super.key,required this.onTap, required this.backgroundColor,required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            color: backgroundColor,
            child: Center(child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }
}