// ignore_for_file: prefer_const_constructors
import 'package:counter_app/app/app.dart';
import 'package:counter_app/core/themes/app_theme.dart';
import 'package:counter_app/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('is a StateFull', (tester) async {
      expect(CounterApp(), isA<StatefulWidget>());
    });

    testWidgets("Test that the app renders properly in light theme",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ThemeCubit(),
          child: CounterApp(key: Key('counterApp')),
        ),
      );

      // Capture a BuildContext object
      final BuildContext context =
          tester.element(find.byKey(Key('counterApp')));

      // Get finders and relevant objects that would be available at first load of MaterialApp()
      final Finder counterPageFinder = find.byKey(Key('counterPage'));
      final Widget counterPage = tester.firstWidget(counterPageFinder);
      final Finder textFinder = find.byKey(Key('customText'));
      final Text text = tester.firstWidget(textFinder);

      // functions
      bool testIsInLightTheme() {
        /// return true if the test is in light theme, else false
        if (Theme.of(context).brightness == Brightness.light) {
          return true;
        }
        return false;
      }

      // Here is just a test to confirm that the MaterialApp is now in dark theme
      expect(
        Theme.of(tester.element(find.byWidget(counterPage))).brightness,
        equals(Brightness.light),
        reason:
            "Since MaterialApp() was set to dark theme when it was built at tester.pumpWidget(), the MaterialApp should be in dark theme",
      );

      // Now let's test the color of the text
      expect(
        text.style?.color,
        testIsInLightTheme()
            ? AppTheme.lightPrimaryColor
            : AppTheme.darkPrimaryColor,
        reason:
            "When MaterialApp is in light theme, text is black. When Material App is in dark theme, text is white",
      );
    });
  });
}
