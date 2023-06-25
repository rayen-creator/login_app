import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/routes/routes_names.dart';
import 'package:mvvm_app/view/screens/home_view.dart';
import 'package:mvvm_app/view/screens/signup_view.dart';

import '../view/screens/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignupView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
