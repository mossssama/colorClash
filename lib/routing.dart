import 'package:demo_app/gameplay/presentation/screens/game_screen.dart';
import 'package:demo_app/gameplay/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gameplay/presentation/controllers/gameplay_cubit.dart';
import 'gameplay/presentation/screens/gameover_screen.dart';
import 'gameplay/presentation/screens/lobby_screen.dart';

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
      final gameArgs = settings.arguments as Map<String,dynamic>;
      String documentId = gameArgs["documentId"];
      String myId = gameArgs["myId"];
      return MaterialPageRoute(builder: (context) => BlocProvider<GamePlayCubit>(create: (context) => GamePlayCubit(documentId:documentId,myId: myId), child: GameScreen(isMultiplayerMode: gameArgs["isMultiplayerMode"],documentId: documentId,myId: myId)));
    case gameOverScreen:
      return MaterialPageRoute(builder: (context) => const GameOverScreen());
  }
}
