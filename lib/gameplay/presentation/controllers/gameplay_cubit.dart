import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/firestore_manager.dart';
import 'package:demo_app/gameplay/gameplay_cards_list.dart';
import 'package:equatable/equatable.dart';

import '../widgets/game_card_widget.dart';
import 'gameplay_helpers.dart';

class GamePlayCubit extends Cubit<GameScore> {
  GamePlayCubit() : super(const GameScore(myScore: 0,opponentScore:  0,generatedValidCards: [],generatedInValidCards: [],gameCards: []));
  CollectionManager collectionManager = CollectionManager(db: FirebaseFirestore.instance, collectionName: "rooms");

  void buildGamePlay() {
    List<int> generatedValidCards = generateValidCards(); // List of seven
    List<int> generatedInValidCards = generateInValidCards(generatedValidCards); // List of two
    List<GameCard> gameCards = [
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[0]].color,
        text: gamePlayCards[generatedValidCards[0]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[1]].color,
        text: gamePlayCards[generatedValidCards[1]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[2]].color,
        text: gamePlayCards[generatedValidCards[2]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[3]].color,
        text: gamePlayCards[generatedValidCards[3]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[4]].color,
        text: gamePlayCards[generatedValidCards[4]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[5]].color,
        text: gamePlayCards[generatedValidCards[5]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[6]].color,
        text: gamePlayCards[generatedValidCards[6]].text,
      ),
      GameCard(
        onTap: increaseMyScoreByOne,
        backgroundColor: gamePlayCards[generatedInValidCards[0]].color,
        text: gamePlayCards[generatedInValidCards[1]].text,
      ),
    ];
    gameCards.shuffle();
    emit(state.copyWith(generatedValidCards: generatedValidCards,generatedInValidCards: generatedInValidCards,gameCards: gameCards));
  }

  void increaseMyScoreByOne() {
    int myNewScore = state.myScore + 1;
    int myOpponentScore = state.opponentScore;

    /// buildGamePlay logic
    List<int> generatedValidCards = generateValidCards(); // List of seven
    List<int> generatedInValidCards = generateInValidCards(generatedValidCards); // List of two
    List<GameCard> gameCards = [
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[0]].color,
        text: gamePlayCards[generatedValidCards[0]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[1]].color,
        text: gamePlayCards[generatedValidCards[1]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[2]].color,
        text: gamePlayCards[generatedValidCards[2]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[3]].color,
        text: gamePlayCards[generatedValidCards[3]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[4]].color,
        text: gamePlayCards[generatedValidCards[4]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[5]].color,
        text: gamePlayCards[generatedValidCards[5]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[6]].color,
        text: gamePlayCards[generatedValidCards[6]].text,
      ),
      GameCard(
        onTap: increaseMyScoreByOne,
        backgroundColor: gamePlayCards[generatedInValidCards[0]].color,
        text: gamePlayCards[generatedInValidCards[1]].text,
      ),
    ];
    gameCards.shuffle();

    GameScore gameScore = state.copyWith(myScore: myNewScore, opponentScore: myOpponentScore,generatedValidCards: generatedValidCards,generatedInValidCards: generatedInValidCards,gameCards: gameCards);
    emit(gameScore);
    notifyFirebaseWithChanges();
  }

  void decreaseMyScoreByTwo() {
    int myNewScore = state.myScore - 2;
    int myOpponentScore = state.opponentScore;

    /// buildGamePlay logic
    List<int> generatedValidCards = generateValidCards(); // List of seven
    List<int> generatedInValidCards = generateInValidCards(generatedValidCards); // List of two
    List<GameCard> gameCards = [
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[0]].color,
        text: gamePlayCards[generatedValidCards[0]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[1]].color,
        text: gamePlayCards[generatedValidCards[1]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[2]].color,
        text: gamePlayCards[generatedValidCards[2]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[3]].color,
        text: gamePlayCards[generatedValidCards[3]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[4]].color,
        text: gamePlayCards[generatedValidCards[4]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[5]].color,
        text: gamePlayCards[generatedValidCards[5]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[6]].color,
        text: gamePlayCards[generatedValidCards[6]].text,
      ),
      GameCard(
        onTap: increaseMyScoreByOne,
        backgroundColor: gamePlayCards[generatedInValidCards[0]].color,
        text: gamePlayCards[generatedInValidCards[1]].text,
      ),
    ];
    gameCards.shuffle();

    emit(state.copyWith(myScore: myNewScore, opponentScore: myOpponentScore,generatedValidCards: generatedValidCards,generatedInValidCards: generatedInValidCards,gameCards: gameCards));
    notifyFirebaseWithChanges();
  }

  void notifyFirebaseWithChanges(){
    collectionManager.updateDocument(documentId: "1234", documentNewMap: {"player1": state.myScore});
  }

  void listenToOpponentScore() {
    collectionManager.subscribeToDocument(
        documentId: "1234",
        desiredKey: "player2",
        executeOnChange: (listenedVal) {
          int myScore = state.myScore;
          int opponentNewScore = int.parse(listenedVal);
          emit(state.copyWith(myScore: myScore,opponentScore: opponentNewScore));
        });
  }

  void resetGameScore() {
    int myNewScore = 0;
    int opponentNewScore = 0;

    /// buildGamePlay logic
    List<int> generatedValidCards = generateValidCards(); // List of seven
    List<int> generatedInValidCards = generateInValidCards(generatedValidCards); // List of two
    List<GameCard> gameCards = [
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[0]].color,
        text: gamePlayCards[generatedValidCards[0]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[1]].color,
        text: gamePlayCards[generatedValidCards[1]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[2]].color,
        text: gamePlayCards[generatedValidCards[2]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[3]].color,
        text: gamePlayCards[generatedValidCards[3]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[4]].color,
        text: gamePlayCards[generatedValidCards[4]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[5]].color,
        text: gamePlayCards[generatedValidCards[5]].text,
      ),
      GameCard(
        onTap: decreaseMyScoreByTwo,
        backgroundColor: gamePlayCards[generatedValidCards[6]].color,
        text: gamePlayCards[generatedValidCards[6]].text,
      ),
      GameCard(
        onTap: increaseMyScoreByOne,
        backgroundColor: gamePlayCards[generatedInValidCards[0]].color,
        text: gamePlayCards[generatedInValidCards[1]].text,
      ),
    ];
    gameCards.shuffle();

    emit(state.copyWith(myScore: myNewScore,opponentScore: opponentNewScore,generatedValidCards: generatedValidCards,generatedInValidCards: generatedInValidCards,gameCards: gameCards));
  }
}

class GameScore extends Equatable {
  final int myScore;
  final int opponentScore;
  final List<int> generatedValidCards;
  final List<int> generatedInValidCards;

  final List<GameCard> gameCards;
  const GameScore({required this.myScore,required  this.opponentScore,required this.generatedValidCards,required this.generatedInValidCards,required this.gameCards});

  GameScore copyWith({int? myScore, int? opponentScore,List<int>? generatedValidCards,List<int>? generatedInValidCards,List<GameCard>? gameCards}) {
    return GameScore(myScore: myScore ?? this.myScore,opponentScore: opponentScore ?? this.opponentScore,generatedValidCards: generatedValidCards ?? this.generatedValidCards,generatedInValidCards: generatedInValidCards ?? this.generatedInValidCards,gameCards: gameCards ?? this.gameCards );
  }

  @override
  List<Object?> get props => [myScore, opponentScore,generatedValidCards,generatedInValidCards,gameCards];
}
