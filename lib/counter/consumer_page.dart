import 'package:bloc_sample_flutter/counter/bloc/counter_bloc.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_event.dart';
import 'package:bloc_sample_flutter/counter/bloc/counter_state.dart';
import 'package:bloc_sample_flutter/login/bloc/login_bloc.dart';
import 'package:bloc_sample_flutter/login/bloc/login_event.dart';
import 'package:bloc_sample_flutter/login/bloc/login_state.dart';
import 'package:bloc_sample_flutter/login/model/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerPage extends StatefulWidget {
  const BlocConsumerPage({super.key});

  @override
  _BlocConsumerPageState createState() => _BlocConsumerPageState();
}

class _BlocConsumerPageState extends State<BlocConsumerPage> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BlocConsumer Example "),
      ),
      body: Center(
        child: Column(
          children: [
            BlocConsumer<CountBloc,CounterState>(builder: (context, state) {
              if (state is CounterInitialState) {
                return Text(state.initialCount.toString(), style: const TextStyle(color: Colors.green),);
              } else if (state is CounterIncrementedState) {
                return Text(state.incrementedCount.toString(), style: const TextStyle(color: Colors.green),);
              } else if (state is CounterDecrementedState) {
                return Text(state.decrementedCount.toString(), style: const TextStyle(color: Colors.green),);
              } else {
                return Container();
              }
            }, listener: (context, state) {
              if (state is CounterIncrementedState) {
                var snackBar = const SnackBar(content: Text("Increment Button Tap"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is CounterDecrementedState) {
                var snackBar = const SnackBar(content: Text("Decrement Button Tap"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }),
            const SizedBox(height: 30,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {

                  BlocProvider.of<CountBloc>(context).add(CounterIncrementEvent(intEvent: counter++));

                }, child: const Text("+",style: TextStyle(color: Colors.green),),),
                const SizedBox(width: 30,),

                ElevatedButton(onPressed: () {
                  BlocProvider.of<CountBloc>(context).add(CounterDecrementEvent(dntEvent:counter--));
                }, child: const Text("-",style: TextStyle(color: Colors.green),),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
