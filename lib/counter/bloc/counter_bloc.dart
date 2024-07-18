
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';



/// BLoC class for handling login events and states
class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(CounterInitState(counter: 0)) {
     on<CounterEvent>((event, emit) {
       // emit(CounterIncrementState(incrementCounter: event.props));
     },);
  }
}
