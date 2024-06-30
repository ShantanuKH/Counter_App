import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for the CounterCubit is CounterState(counterValue: 0, wasIncremented: false)', () {
      expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue: -1, wasIncremented: false) when cubit.decrement() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}


/*

  Test Fails

  Expected: <Instance of 'CounterState'>
  Actual: <Instance of 'CounterState'>

package:matcher                                     expect
package:flutter_test/src/widget_tester.dart 474:18  expect
test\cubit\counter_cubit_test.dart 19:11            main.<fn>.<fn>

-----> The test fails initially though it looks same.

-----> It is because the instances are store in different part of memory.

-----> Dart will see the memory instead of the actial value ans so it shows that the test fails

*/ 


/* 
    To solve this we will use popular library called "Equatable Library"
    

  ------> By adding the following and doing some chnages in the code our test will pass



*/