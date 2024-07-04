// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_app/business_logic/cubit/counter_cubit.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title),
        ),
        body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Number was incremented by 1 😁"),
                  duration: Duration(milliseconds: 300),
                ),
              );
            } else if (state.wasIncremented == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Number was decremented by 1 😢"),
                  duration: Duration(milliseconds: 300),
                ),
              );
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                SizedBox(
                  height: 34,
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    );
                  },
                ),
                SizedBox(
                  height: 34,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      tooltip: "Decrement",
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      tooltip: "Increment",
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                MaterialButton(
                          hoverElevation: 10,
                          color: Colors.green,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  // BlocProvider.value(value: CounterCubit(),  this will provide the new state to the new screen but to keep the instance same we did this
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<CounterCubit>(context),
                                  child: SecondScreen(
                                    title: 'SecondScreen', 
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text("Go to Second Screen"),
)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
