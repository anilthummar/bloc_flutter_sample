import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterInitState extends CounterState {

  int? counter;

  CounterInitState({required this.counter});
  @override
  List<Object?> get props => [counter];
}

class CounterIncrementState extends CounterState {
  int? incrementCounter;

  CounterIncrementState({required this.incrementCounter});

  @override
  List<Object?> get props => [incrementCounter];
}


class CounterDecrementState extends CounterState {
  int? decrementCounter;

  CounterDecrementState({required this.decrementCounter});

  @override
  List<Object?> get props => [decrementCounter];
}
