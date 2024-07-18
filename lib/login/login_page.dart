import 'package:bloc_sample_flutter/login/bloc/login_bloc.dart';
import 'package:bloc_sample_flutter/login/bloc/login_event.dart';
import 'package:bloc_sample_flutter/login/bloc/login_state.dart';
import 'package:bloc_sample_flutter/login/model/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc,LoginState>(
        buildWhen: (previous, current) {

          print("BlocBuilderLoginBloc _buildWhen previous:${previous.toString()} , current:${current.toString()}");

          return true;

        },
        builder: (context, state) {
          print("BlocBuilderLoginBloc state:${state.toString()}");

          if(state is LoginInitState){
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  LoginTextField(
                    hintText: 'Username',
                    controller: userNameController,
                  ),
                  const SizedBox(height: 20),
                  LoginTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  LoginButton(
                    userNameController: userNameController,
                    passwordController: passwordController,
                  ),
                ],
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

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const LoginTextField({
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
    );
  }
}

class LoginButton extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  const LoginButton({
    required this.userNameController,
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final loginBloc = BlocProvider.of<LoginBloc>(context);
        final loginRequestModel = LoginRequestModel(
          username: userNameController.text,
          password: passwordController.text,
        );
        loginBloc.add(LoginRequestEvent(loginRequestModel: loginRequestModel));
      },
      child: const Text("Login"),
    );
  }
}
