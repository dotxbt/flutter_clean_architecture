part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final ThemeData themeData;
  const ChangeTheme({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
