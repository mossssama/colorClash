
import 'package:demo_app/presentation/screens/game_screen.dart';
import 'package:demo_app/presentation/screens/gameover_screen.dart';
import 'package:demo_app/presentation/screens/home_screen.dart';
import 'package:demo_app/presentation/screens/lobby_screen.dart';
import 'package:flutter/material.dart';

/// App Screens
const String homeScreen = '/homeScreen';
const String lobbyScreen = '/lobbyScreen';
const String gameScreen = '/gameScreen';
const String gameOverScreen = '/gameOverScreen';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case lobbyScreen:
      return MaterialPageRoute(builder: (context) => const LobbyScreen());
    case gameScreen:
      return MaterialPageRoute(builder: (context) => const GameScreen());
    case gameOverScreen:
      return MaterialPageRoute(builder: (context) => const GameOverScreen());
  }
}
