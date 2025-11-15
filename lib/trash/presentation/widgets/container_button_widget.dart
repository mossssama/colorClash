import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  String buttonSign;
  Color buttonBackground;
  void Function() onPressed;
  ContainerButton({super.key, required this.buttonSign, required this.buttonBackground, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: buttonBackground,
          child: Center(
            child: Text(
              buttonSign,
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}