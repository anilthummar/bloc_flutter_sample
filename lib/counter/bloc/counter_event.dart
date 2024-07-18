import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncrementEvent extends CounterEvent {

  int? incrementEvent;

  IncrementEvent({required this.incrementEvent});

  @override
  List<Object?> get props => [incrementEvent];
}
class DecrementEvent extends CounterEvent {

  int? decrementEvent;

  DecrementEvent({required this.decrementEvent});

  @override
  List<Object?> get props => [decrementEvent];
}
