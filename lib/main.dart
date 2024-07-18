import 'package:bloc_sample_flutter/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/login_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(
        create: (context) =>LoginBloc(),
        )
     ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:LoginPage(),
      ),
    );
  }
}
