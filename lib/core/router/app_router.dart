import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../exception/route_exception.dart';
import '../../counter/view/counter_page.dart';

class AppRouter {
  AppRouter._();
  static const String home = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const CounterPage(
              title: Strings.homeScreenTitle, key: Key('counterPage')),
        );

      default:
        throw RouteException('Rout not found');
    }
  }
}
