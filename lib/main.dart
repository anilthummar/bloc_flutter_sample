import 'package:bloc_sample_flutter/login/bloc/login_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter/RepositoryProvider/counter_repository.dart';
import 'counter/bloc/counter_bloc.dart';
import 'counter/bloc/counter_repository_provider_bloc.dart';
import 'home_page.dart';
import 'login/login_page.dart';

void main(){
  runApp(
    DevicePreview(
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp(),)

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(
        create: (context) =>LoginBloc(),
        ),
       BlocProvider(
         create: (context) =>CountBloc(),
       ),
       BlocProvider(
         create: (context) =>CounterRepositoryBloc(repository: RepositoryProvider.of<CounterRepository>(context),
       ),),
     ],
      child:   const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
