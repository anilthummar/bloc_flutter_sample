import 'package:bloc_sample_flutter/counter/bloc/counter_bloc.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_event.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorPage extends StatelessWidget {
   int index=5;

  BlocSelectorPage({Key? key,  index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocSelector Example'),
      ),
      body: BlocSelector<CountBloc, CounterState, int>(
        selector: (state) {
          if (state is CounterInitialState) {
            return state.initialCount;
          } else if (state is CounterIncrementedState) {
            return state.incrementedCount;
          } else if (state is CounterDecrementedState) {
            return state.decrementedCount;
          }
          return 0; // Default fallback value
        },
        builder: (context, task) {
          return ListTile(
            title: Center(
              child: Text(
                task.toString(),
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<CountBloc>().add(CounterDecrementEvent(dntEvent: index--));
              },
              child: const Icon(Icons.remove),
            ),
            leading: ElevatedButton(
              onPressed: () {
                context.read<CountBloc>().add(CounterIncrementEvent(intEvent: index++));
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}