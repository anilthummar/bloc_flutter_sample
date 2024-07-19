import 'package:bloc_sample_flutter/counter/bloc/counter_bloc.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_event.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

int cont=0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      BlocListener<CountBloc,CounterState>(
        listener: (context, state) {

          if (state is CounterIncrementedState) {
            var snackBar = const SnackBar(content: Text("Increment Button Tap"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is CounterDecrementedState) {
            var snackBar = const SnackBar(content: Text("Decrement Button Tap"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      child: Scaffold(
        appBar: AppBar(title: const Text( "Counter App "),),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              BlocBuilder<CountBloc,CounterState>(builder: (context, state) {
                if (state is CounterInitialState) {
                  return Text(state.initialCount.toString(), style: const TextStyle(color: Colors.green),);
                } else if (state is CounterIncrementedState) {
                  return Text(state.incrementedCount.toString(), style: const TextStyle(color: Colors.green),);
                } else if (state is CounterDecrementedState) {
                  return Text(state.decrementedCount.toString(), style: const TextStyle(color: Colors.green),);
                } else {
                  return Container();
                }
              },),

              const SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {

                    BlocProvider.of<CountBloc>(context).add(CounterIncrementEvent(intEvent: cont++));

                  }, child: const Text("+",style: TextStyle(color: Colors.green),),),

                  const SizedBox(width: 30,),

                  ElevatedButton(onPressed: () {
                    BlocProvider.of<CountBloc>(context).add(CounterDecrementEvent(dntEvent:cont--));
                  }, child: const Text("-",style: TextStyle(color: Colors.green),),),
                ],
              )
            ],
          ),
        ),
      ),
      );

  }
}
