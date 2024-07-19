
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

/// BLoC for managing counter events and states.
class CountBloc extends Bloc<CounterEvent, CounterState> {

  /// Initializes the CountBloc with the initial state.
  CountBloc() : super(CounterInitialState(initialCount: 0)) {

    /// Event handler for incrementing the counter.
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementedState(incrementedCount: event.intEvent + 1));
    });

    /// Event handler for decrementing the counter.
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementedState(decrementedCount: event.dntEvent - 1));
    });
  }
}
