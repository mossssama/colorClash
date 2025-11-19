import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/app_colors.dart';
import 'package:demo_app/firestore_manager.dart';
import 'package:demo_app/gameplay/gameplay_cards_list.dart';
import 'package:demo_app/gameplay/presentation/controllers/gameplay_cubit.dart';
import 'package:demo_app/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_bar_countdown/progress_bar_countdown.dart';
import '../controllers/gameplay_helpers.dart';
import '../widgets/game_card_widget.dart';
import '../widgets/game_cards_column.dart';
import '../widgets/game_over_bottom_sheet.dart';
import '../widgets/multiplayer_app_bar_title.dart';
import '../widgets/single_player_app_bar_title.dart';

class GameScreen extends StatefulWidget {
  bool isMultiplayerMode;
  GameScreen({super.key, required this.isMultiplayerMode});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<CardSpecs> cards = gamePlayCards;

  List<int> generatedValidCards = [];
  List<int> generatedInValidCards = [];
  List<GameCard> gameCards = [];

  Duration actualGameDuration = const Duration(seconds: 60);
  ProgressBarCountdownController progressBarCountdownController = ProgressBarCountdownController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late CollectionManager collectionManager;
  GamePlayCubit gamePlayCubit = GamePlayCubit();
  late Duration duration;
  @override
  void initState() {
    duration = actualGameDuration;
    collectionManager = CollectionManager(db: db, collectionName: "rooms");
    gamePlayCubit.listenToOpponentScore();
    buildGamePlay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamePlayCubit>(
      create: (context) => gamePlayCubit,
      child: BlocBuilder<GamePlayCubit, GameScore>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor,
              centerTitle: widget.isMultiplayerMode ? false : true,
              title: widget.isMultiplayerMode
                  ? MultiplayerAppBarTitle(
                myName: "Player1",
                opponentName: "Player2",
                myScore: state.myScore,
                opponentScore: state.opponentScore,
              )
                  : SinglePlayerAppBarTitle(score: state.myScore),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ProgressBarCountdown(
                      controller: progressBarCountdownController,
                      initialDuration: duration,
                      progressColor: Colors.grey,
                      progressBackgroundColor: Colors.red,
                      countdownDirection: ProgressBarCountdownAlignment.right,
                      autoStart: true,
                      height: 12,
                      hideText: true,
                      onComplete: () => onTimeCompletes(state.myScore),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GameCardsColumn(gameCards: gameCards),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void buildGamePlay() {
    generatedValidCards = generateValidCards(); // List of seven
    generatedInValidCards = generateInValidCards(generatedValidCards); // List of two
    gameCards = [
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[0]].color,
        text: cards[generatedValidCards[0]].text,
      ),
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[1]].color,
        text: cards[generatedValidCards[1]].text,
      ),
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[2]].color,
        text: cards[generatedValidCards[2]].text,
      ),
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[3]].color,
        text: cards[generatedValidCards[3]].text,
      ),
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[4]].color,
        text: cards[generatedValidCards[4]].text,
      ),
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[5]].color,
        text: cards[generatedValidCards[5]].text,
      ),
      GameCard(
        onTap: decreaseScoreByTwo,
        backgroundColor: cards[generatedValidCards[6]].color,
        text: cards[generatedValidCards[6]].text,
      ),
      GameCard(
        onTap: increaseScoreByOne,
        backgroundColor: cards[generatedInValidCards[0]].color,
        text: cards[generatedInValidCards[1]].text,
      ),
    ];
    gameCards.shuffle();
  }

  increaseScoreByOne() {
    gamePlayCubit.increaseMyScoreByOne();
    notifyFirestoreWithChanges();
  }

  decreaseScoreByTwo() {
    gamePlayCubit.decreaseMyScoreByTwo();
    notifyFirestoreWithChanges();
  }

  notifyFirestoreWithChanges() {
    buildGamePlay();
    collectionManager.updateDocument(documentId: "1234", documentNewMap: {"player1": gamePlayCubit.state.myScore});
  }

  resetGame() {
    Navigator.pop(context);
    setState(() {
      progressBarCountdownController.reset(duration: actualGameDuration);
      progressBarCountdownController.start();
      gamePlayCubit.resetGameScore();
    });
    buildGamePlay();
  }

  returnToHome() {
    Navigator.pushNamedAndRemoveUntil(context, homeScreen, (_) => false);
  }

  onTimeCompletes(int score) {
    showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xFF1A0A0A),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        isDismissible: false,
        builder: (_) => GameOverBottomSheet(score: score, resetGame: resetGame, returnToHome: returnToHome));
  }
}
