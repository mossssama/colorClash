import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/firestore_manager.dart';
import 'package:equatable/equatable.dart';

class GamePlayCubit extends Cubit<GameScore> {
  GamePlayCubit() : super(const GameScore(myScore: 0,opponentScore:  0));
  CollectionManager collectionManager = CollectionManager(db: FirebaseFirestore.instance, collectionName: "rooms");

  void increaseMyScoreByOne() {
    int myNewScore = state.myScore + 1;
    int myOpponentScore = state.opponentScore;
    GameScore gameScore = state.copyWith(myScore: myNewScore, opponentScore: myOpponentScore);
    emit(gameScore);
  }

  void decreaseMyScoreByTwo() {
    int myNewScore = state.myScore - 2;
    int myOpponentScore = state.opponentScore;
    emit(state.copyWith(myScore: myNewScore, opponentScore: myOpponentScore));
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
    emit(state.copyWith(myScore: myNewScore,opponentScore: opponentNewScore));
  }
}

class GameScore extends Equatable {
  final int myScore;
  final int opponentScore;
  const GameScore({required this.myScore,required  this.opponentScore});

  GameScore copyWith({int? myScore, int? opponentScore}) {
    return GameScore(myScore: myScore ?? this.myScore,opponentScore: opponentScore ?? this.opponentScore);
  }

  @override
  List<Object?> get props => [myScore, opponentScore];
}
