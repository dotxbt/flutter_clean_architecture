import 'package:clean_architecture_flutter/features/auth/presenter/pages/login_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => const LoginPage(),
};
