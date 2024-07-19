import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterIncrementEvent extends CounterEvent {
  int intEvent;
  CounterIncrementEvent({required this.intEvent});

  @override
  List<Object?> get props => [intEvent];
}

class CounterDecrementEvent extends CounterEvent {
  int dntEvent;
  CounterDecrementEvent({required this.dntEvent});

  @override
  List<Object?> get props => [dntEvent];
}
