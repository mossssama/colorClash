import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../../firestore_manager.dart';
import '../../../routing.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/app_divider.dart';
import '../widgets/heading_text.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  CollectionManager collectionManager = CollectionManager(db: FirebaseFirestore.instance, collectionName: "rooms");
  TextEditingController gameIdController = TextEditingController();
  String documentId = "${Random().nextInt(100000)}";
  String myId = "${Random().nextInt(100000)}";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    gameIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(automaticallyImplyLeading: false, backgroundColor: primaryColor, centerTitle: true, title: const Text("Play with friends", style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const HeadingText(text: "Start a new game", fontColor: Colors.white, fontSize: 28),
                  const SizedBox(height: 8),
                  const HeadingText(text: "Create a new game and invite your friends", fontColor: Colors.grey, fontSize: 16),
                  const SizedBox(height: 8),
                  Container(
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Your Game ID is: ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(documentId, style: const TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      )),
                  const SizedBox(height: 8),
                  AppButton(
                      onTap: () {
                        collectionManager.addNewDocument(documentId: documentId, documentMap: {myId: "0"});
                        Navigator.pushReplacementNamed(context, gameScreen, arguments: {"isMultiplayerMode": true, "documentId": documentId, "myId": myId});
                      },
                      backgroundColor: Colors.red,
                      text: 'Create a new Game',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold),
                ],
              ),
              const AppDivider(),
              Column(
                children: [
                  const HeadingText(text: "Join a game", fontColor: Colors.white, fontSize: 28),
                  const SizedBox(height: 8),
                  const HeadingText(text: "Enter a game ID from a friend to join the game", fontColor: Colors.grey, fontSize: 16),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.blueAccent, width: 1),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: gameIdController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Game ID',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.tag),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AppButton(
                      onTap: () {
                        String documentId = gameIdController.text;
                        collectionManager.updateDocument(documentId: documentId, documentNewMap: {myId: "0"});
                        Navigator.pushReplacementNamed(context, gameScreen, arguments: {"isMultiplayerMode": true, "documentId": documentId, "myId": myId});
                      },
                      backgroundColor: Colors.blueGrey,
                      text: 'Join a Game',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
