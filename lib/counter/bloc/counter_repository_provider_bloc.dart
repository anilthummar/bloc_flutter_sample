import 'package:flutter_bloc/flutter_bloc.dart';

import '../CounterRepository/counter_repository.dart';
import 'counter_event.dart';
import 'counter_state.dart';

// BLoC
class CounterRepositoryBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository repository;

  CounterRepositoryBloc({required this.repository})
      : super(CounterInitialState(initialCount: repository.fetchInitialCount())) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementedState(incrementedCount: event.intEvent + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementedState(decrementedCount: event.dntEvent - 1));
    });
  }
}
