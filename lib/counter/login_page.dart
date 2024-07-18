import 'package:bloc_sample_flutter/login/bloc/login_bloc.dart';
import 'package:bloc_sample_flutter/login/bloc/login_event.dart';
import 'package:bloc_sample_flutter/login/bloc/login_state.dart';
import 'package:bloc_sample_flutter/login/model/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc,LoginState>(
        buildWhen: (previous, current) {

          return true;

        },
        builder: (context, state) {
          print("BlocBuilderLoginBloc state:${state.toString()}");

          if(state is LoginInitState){
            return const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
              ),
            );
          }else if(state is LoginLoadingState){
            return const CircularProgressIndicator();
          }else if(state is LoginLoadedState){
            return Center( child: Text(state.loginResponseModel.email ?? "",style: const TextStyle(color: Colors.green),),);
          }else if (state is LoginErrorState){
            return Center( child: Text(state.errorMessage ?? "",style: const TextStyle(color: Colors.red)),);
          }else{
            return const SizedBox.shrink();
          }

        },

      ),
    );
  }
}
