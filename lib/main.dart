import 'package:counter_app/business_logic/cubit/counter_cubit.dart';
import 'package:counter_app/presentation/screens/home_screen.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // For testing
  final CounterState counterState1 =
      CounterState(counterValue: 1, wasIncremented: false);
  final CounterState counterState2 =
      CounterState(counterValue: 1, wasIncremented: false);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // This is called as "Name Routing"

      // The routes parameter with which the help of that we can go to the multiple screens, It contain map pairs, MEans the PAirs that containt eh route name and scrren of object that we are going to assign to
      routes: {
//  "/" -> Default called as Home Route name

        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: "HomeScreen", color: Colors.orange),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                  title: "SecondScreen", color: Colors.lightBlueAccent),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child:
                  ThirdScreen(title: "ThirdScreen", color: Colors.greenAccent),
            )
      },
    );
  }

  // We need to manually close the CounterCubit here and so we made stls to stfl widget and used diospose method
@override
void dispose() {
  _counterCubit.close();
  super.dispose();
}
}


