import 'package:demo_app/app_colors.dart';
import 'package:demo_app/routing.dart';
import 'package:flutter/material.dart';

import '../widgets/app_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // rgb(33,17,17)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: Text("Color Clash",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold))),
            AppButton(onTap: (){
              Navigator.pushNamed(context, gameScreen); /// TODO: to add argument
            },backgroundColor: Colors.red,text: "Single Player",textColor: Colors.white,fontWeight: FontWeight.bold),
            const SizedBox(height: 8),
            AppButton(onTap: (){
              Navigator.pushNamed(context, gameScreen); /// TODO: to add argument
            },backgroundColor: darkGreyColor,text: "Multiplayer",textColor: Colors.white,fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}


