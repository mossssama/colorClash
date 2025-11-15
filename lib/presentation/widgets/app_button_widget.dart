import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  Function() onTap;
  Color backgroundColor;
  String text;
  Color textColor;
  FontWeight fontWeight;
  AppButton({super.key,required this.onTap,required this.backgroundColor,required this.text,required this.textColor,this.fontWeight=FontWeight.normal});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: double.infinity,
        child: Center(child: Text(text, style: TextStyle(color: textColor,fontWeight: fontWeight))),
      ),
    );
  }

}