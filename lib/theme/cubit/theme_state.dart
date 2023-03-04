part of 'theme_cubit.dart';

@immutable
abstract class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

class ThemeMod extends ThemeState {
  final ThemeMode themeMod;
  const ThemeMod({required this.themeMod}) : super(themeMod);

  @override
  List<Object?> get props => [themeMod];
}
