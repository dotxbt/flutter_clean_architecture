part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState(this.themeData);
  final ThemeData themeData;

  @override
  List<Object> get props => [themeData];
}

final class ThemeInitial extends ThemeState {
  ThemeInitial() : super(lightTheme);
}

final class ThemeChangeState extends ThemeState {
  final ThemeData tData;
  const ThemeChangeState(this.tData) : super(tData);
}
