

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

// class CounterProvider with ChangeNotifier{
//   final List<int> _counters = [0,0,0,0,0];
//   List<int> get counters => _counters;
//
//   void increment(int index) {
//     _counters[index]++;
//     notifyListeners();
//   }
//
//   void decrement(int index) {
//     _counters[index]--;
//     notifyListeners();
//   }
// }


class CounterCubit extends Cubit<List<int>> {
  CounterCubit() : super([0,0,0,0,0]);

  void increment(int index){
    state[index]++;
    emit(List.from(state));
  }

  void decrement(int index){
    state[index]--;
    emit(List.from(state));
  }
}