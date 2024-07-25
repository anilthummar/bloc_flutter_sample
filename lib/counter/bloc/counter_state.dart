import 'package:equatable/equatable.dart';

/// Abstract base class for counter states.
/// It extends Equatable to enable state comparison.
abstract class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// State representing the initial state of the counter.
class CounterInitialState extends CounterState {
  final int initialCount;

  CounterInitialState({required this.initialCount});

  @override
  List<Object?> get props => [initialCount];
}

/// State representing the counter value after increment.
class CounterIncrementedState extends CounterState {
  final int incrementedCount;

  CounterIncrementedState({required this.incrementedCount});

  @override
  List<Object?> get props => [incrementedCount];
}

/// State representing the counter value after decrement.
class CounterDecrementedState extends CounterState {
  final int decrementedCount;

  CounterDecrementedState({required this.decrementedCount});

  @override
  List<Object?> get props => [decrementedCount];
}

