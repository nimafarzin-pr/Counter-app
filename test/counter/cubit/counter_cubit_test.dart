import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, const CounterState(value: 0));
    });

    group('increment', () {
      blocTest<CounterCubit, CounterState>(
        'emits [1] when state is 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.increment(),
        expect: () => const [CounterState(value: 1)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: CounterCubit.new,
        act: (cubit) => cubit
          ..increment()
          ..increment(),
        expect: () => const [CounterState(value: 1), CounterState(value: 2)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [42] when state is 41',
        build: CounterCubit.new,
        seed: () => const CounterState(value: 41),
        act: (cubit) => cubit.increment(),
        expect: () => const [CounterState(value: 42)],
      );
    });

    group('decrement', () {
      blocTest<CounterCubit, CounterState>(
        'emits [-1] when state is 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.decrement(),
        expect: () => const [CounterState(value: -1)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: CounterCubit.new,
        act: (cubit) => cubit
          ..decrement()
          ..decrement(),
        expect: () => const [CounterState(value: -1), CounterState(value: -2)],
      );

      blocTest<CounterCubit, CounterState>(
        'emits [42] when state is 43',
        build: CounterCubit.new,
        seed: () => const CounterState(value: 43),
        act: (cubit) => cubit.decrement(),
        expect: () => const [CounterState(value: 42)],
      );
    });
  });
}
