/*
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:training_bloc/logic/cubit/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'Testing the inital state, should return counterValue: 0 and wasIncremented: false',
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest(
      'Testing increment, should return counterValue: 1 and wasIncremented: true',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'Testing decrement, should return counterValue: -1 and wasIncremented: false',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
*/
