import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exception/route_exception.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  AppRouter._();
  static const String home = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(title: Strings.homeScreenTitle),
        );

      default:
        throw RouteException('Rout not found');
    }
  }
}
