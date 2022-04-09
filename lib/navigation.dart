import 'package:dating_app/models/models.dart';
import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/users/user_screen.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const homeSreen = '/';
  static const userScreen = '/users';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.homeSreen: (_) => HomeScreen(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.userScreen:
        final arguments = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => UserScreen(user: arguments as User));
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }

  // static void resetNavigation(BuildContext context) {
  //   Navigator.of(context).pushNamedAndRemoveUntil(
  //       MainNavigationRouteNames.loaderWidget, (route) => false);
  // }
}
