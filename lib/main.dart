import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unlee/config/route/routes.dart';
import 'package:unlee/usecase/bloc/theme_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeBloc(), child: const AppChild());
  }
}

class AppChild extends StatelessWidget {
  const AppChild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        title: 'Unlee',
        routes: routes,
        theme: state.themeData,
        darkTheme: state.themeData,
        initialRoute: "/login",
      );
    });
  }
}
