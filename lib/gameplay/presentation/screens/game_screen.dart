import 'package:demo_app/app_colors.dart';
import 'package:demo_app/gameplay/gameplay_cards_list.dart';
import 'package:demo_app/gameplay/presentation/controllers/gameplay_cubit.dart';
import 'package:demo_app/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_bar_countdown/progress_bar_countdown.dart';
import '../widgets/game_cards_column.dart';
import '../widgets/game_over_bottom_sheet.dart';
import '../widgets/multiplayer_app_bar_title.dart';
import '../widgets/single_player_app_bar_title.dart';

class GameScreen extends StatefulWidget {
  bool isMultiplayerMode;
  String? documentId;
  String? myId;
  GameScreen({super.key, required this.isMultiplayerMode,this.documentId,this.myId});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<CardSpecs> cards = gamePlayCards;

  Duration actualGameDuration = const Duration(seconds: 90);
  ProgressBarCountdownController progressBarCountdownController = ProgressBarCountdownController();
  late Duration duration;
  @override
  void initState() {
    duration = actualGameDuration;
    if(widget.isMultiplayerMode){
      context.read<GamePlayCubit>().listenToOpponentScore();
    }
    context.read<GamePlayCubit>().buildGamePlay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamePlayCubit, GameScore>(
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
                GameCardsColumn(gameCards: state.gameCards),
              ],
            ),
          ),
        );
      },
    );
  }

  resetGame() {
    Navigator.pop(context);
    setState(() {
      progressBarCountdownController.reset(duration: actualGameDuration);
      progressBarCountdownController.start();
      context.read<GamePlayCubit>().resetGameScore();
    });
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
