import 'package:counter_app/app/app.dart';
import 'package:counter_app/counter/view/counter_page.dart';
import 'package:counter_app/theme/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterPage', () {
    testWidgets('render CounterPage', (widgetTester) async {
      await widgetTester.pumpWidget(BlocProvider(
        create: (context) => ThemeCubit(),
        child: const CounterApp(),
      ));
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
