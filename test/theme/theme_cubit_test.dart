import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('ThemeCubit', () {
    test('initial state is light', () {
      expect(ThemeCubit().state, const ThemeMod(themeMod: ThemeMode.light));
    });

    group('dark theme', () {
      blocTest<ThemeCubit, ThemeState>(
        'emits [dark] when state is light',
        build: ThemeCubit.new,
        act: (cubit) => cubit.updateAppTheme(brightness: Brightness.dark),
        expect: () => const [ThemeMod(themeMod: ThemeMode.dark)],
      );

      blocTest<ThemeCubit, ThemeState>(
        'emits [dark, light] when state is light and invoked twice',
        build: ThemeCubit.new,
        act: (cubit) => cubit
          ..updateAppTheme(brightness: Brightness.dark)
          ..updateAppTheme(brightness: Brightness.light),
        expect: () => const [
          ThemeMod(themeMod: ThemeMode.dark),
          ThemeMod(themeMod: ThemeMode.light),
        ],
      );

      blocTest<ThemeCubit, ThemeState>(
        'emits [dark,light,dark] when state is light and invoked twice',
        build: ThemeCubit.new,
        act: (cubit) => cubit
          ..updateAppTheme(brightness: Brightness.dark)
          ..updateAppTheme(brightness: Brightness.light)
          ..updateAppTheme(brightness: Brightness.dark),
        expect: () => const [
          ThemeMod(themeMod: ThemeMode.dark),
          ThemeMod(themeMod: ThemeMode.light),
          ThemeMod(themeMod: ThemeMode.dark),
        ],
      );
    });
  });
}
