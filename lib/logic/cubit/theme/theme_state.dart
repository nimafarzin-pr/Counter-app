part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);
}

class ThemeMod extends ThemeState {
  final ThemeMode themeMod;
  const ThemeMod({required this.themeMod}) : super(themeMod);
}
