import 'package:bloc_sample_flutter/counter/bloc/counter_event.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'RepositoryProvider/counter_repository.dart';
import 'bloc/counter_repository_provider_bloc.dart';

class RepositoryProviderPage extends StatelessWidget {
  final int index = 5;

  RepositoryProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CounterRepository(),
      child: BlocProvider(
        create: (context) => CounterRepositoryBloc(
          repository: RepositoryProvider.of<CounterRepository>(context),
        ),
        child: CounterRepositoryProviderPage(index: index),
      ),
    );
  }
}

class CounterRepositoryProviderPage extends StatelessWidget {
  final int index;

  CounterRepositoryProviderPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter with Repository'),
      ),
      body: Center(
        child: BlocSelector<CounterRepositoryBloc, CounterState, int>(
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    task.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CounterRepositoryBloc>()
                            .add(CounterDecrementEvent(dntEvent: task));
                      },
                      child: const Icon(Icons.remove),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CounterRepositoryBloc>()
                            .add(CounterIncrementEvent(intEvent: task));
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
