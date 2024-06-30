import 'package:counter_app/business_logic/cubit/counter_cubit.dart';
import 'package:counter_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  // For testing
  final CounterState counterState1 =
      CounterState(counterValue: 1, wasIncremented: false);
      final CounterState counterState2 =
      CounterState(counterValue: 1, wasIncremented: false);

      
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(title: 'Simple Counter App Using Bloc', color:Colors.lightBlueAccent),
      ),
    );
  }
}

