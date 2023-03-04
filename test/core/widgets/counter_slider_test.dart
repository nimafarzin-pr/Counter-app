import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:counter_app/counter/cubit/counter_cubit.dart';
import 'package:counter_app/counter/view/counter_view.dart';

class MockCounterCubit extends MockCubit<CounterState>
    implements CounterCubit {}

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
  });

  group('counter slider', () {
    testWidgets('renders current CounterCubit state', (tester) async {
      when(() => counterCubit.state).thenReturn(const CounterState(value: 42));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('drag increment button invokes increment', (tester) async {
      when(() => counterCubit.state).thenReturn(const CounterState(value: 0));
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );

      final finder = find.byKey(const Key('slider'));
      await tester.drag(finder, const Offset(100, 0));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('drag increment button invokes increment', (tester) async {
      when(() => counterCubit.state).thenReturn(const CounterState(value: 0));
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );

      final finder = find.byKey(const Key('slider'));
      await tester.drag(finder, const Offset(0, -100));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('drag decrement button invokes decrement', (tester) async {
      when(() => counterCubit.state).thenReturn(const CounterState(value: 0));
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      final finder = find.byKey(const Key('slider'));
      await tester.drag(finder, const Offset(0, 100));
      verify(() => counterCubit.decrement()).called(1);
    });

    testWidgets('drag decrement button invokes decrement', (tester) async {
      when(() => counterCubit.state).thenReturn(const CounterState(value: 0));
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      final finder = find.byKey(const Key('slider'));
      await tester.drag(finder, const Offset(-100, 0));
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}
