import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:counter_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('drag button, verify counter', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      //! increment
      final finder = find.byKey(const Key('slider'));
      await tester.drag(finder, const Offset(100, 0));

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);

      //! decrement
      final finder2 = find.byKey(const Key('slider'));
      await tester.drag(finder2, const Offset(0, 100));

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter decrements to 0.
      expect(find.text('0'), findsOneWidget);
    });
  });
}
