import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static const Color lightBackgroundColor = Color(0xffA3C7D6);
  static const Color lightPrimaryColor = Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static const Color lightParticlesColor = Color(0x44948282);

  static const Color darkBackgroundColor = Color(0xFF1A2127);
  static const Color darkPrimaryColor = Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static const Color darkParticlesColor = Color(0x441C2A3D);

  static final lightTheme = ThemeData.from(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: lightPrimaryColor),
      titleLarge: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
          color: lightPrimaryColor),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontFamily: 'Hind', color: lightPrimaryColor),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: lightPrimaryColor,
      secondary: lightAccentColor,
      background: lightBackgroundColor,
      brightness: Brightness.light,
    ),
  ).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData.from(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: lightPrimaryColor),
      titleLarge: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
          color: lightPrimaryColor),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontFamily: 'Hind', color: lightPrimaryColor),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: darkPrimaryColor,
      secondary: darkAccentColor,
      background: darkBackgroundColor,
      brightness: Brightness.dark,
    ),
  ).copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: themeMode == ThemeMode.light
            ? lightBackgroundColor
            : darkBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}
