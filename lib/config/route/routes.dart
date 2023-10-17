import 'package:flutter/material.dart';
import 'package:unlee/features/auth/presenter/pages/login_page.dart';
import 'package:unlee/features/home/presenter/pages/home_page.dart';
import 'package:unlee/features/utils/pages/theme_page.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => const LoginPage(),
  "/home": (BuildContext context) => const HomePage(),
  "/theme": (BuildContext context) => const ThemePage(),
};
