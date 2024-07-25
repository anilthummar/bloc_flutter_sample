
import 'package:bloc_sample_flutter/counter/counter_page.dart';
import 'package:bloc_sample_flutter/login/login_page.dart';
import 'package:flutter/material.dart';

import 'counter/bloc_selector_page.dart';
import 'counter/consumer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: const Text("Bloc Concept"),) ,
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));

            }, child: const Text("Bloc Build/Provide Example")),
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage()));

            }, child: const Text("Bloc Listener Consumer Example")),
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => const BlocConsumerPage()));

            }, child: const Text("Bloc Consumer Example")),

            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>   BlocSelectorPage()));

            }, child: const Text("BlocSelector Example")),
          ],
        ),
      ),
    );
  }
}
