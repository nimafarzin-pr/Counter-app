import 'package:bloc/bloc.dart';
import 'package:counter_app/core/themes/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeMod(themeMod: ThemeMode.light));
  void updateAppTheme({Brightness? brightness}) async {
    Brightness currentBrightness;
    if (brightness != null) {
      currentBrightness = brightness;
    } else {
      currentBrightness = AppTheme.currentSystemBrightness;
    }
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode themeMode) async {
    await AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeMod(themeMod: themeMode));
  }
}
