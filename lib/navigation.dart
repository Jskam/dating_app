
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/repositories/auth_repository.dart';
import 'package:dating_app/screens/chat/chat_screen.dart';
import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/matches/matches_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screen.dart';
import 'package:dating_app/screens/profile/profile_screen.dart';
import 'package:dating_app/screens/users/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MainNavigationRouteNames {
  static const homeSreen = '/';
  static const userScreen = '/users';
  static const onboardingScreen = 'onboarding';
  static const matchesScreen = '/matches';
  static const profileScreen = '/profile';
  static const chatScreen = '/matches/chat';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.homeSreen: (_) => const HomeScreen(),

    MainNavigationRouteNames.onboardingScreen: (_) => BlocProvider(
          create: (_) => SignupCubit(authRepository: AuthRepository()),
          child: const OnboardingScreen(),
        ),

    MainNavigationRouteNames.matchesScreen: (_) => const MatchesScreen(),
    MainNavigationRouteNames.profileScreen: (_) => const ProfileScreen(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.userScreen:
        final arguments = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => UserScreen(user: arguments as User),
        );
      case MainNavigationRouteNames.chatScreen:
        final arguments = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ChatScreen(userMatch: arguments as UserMatch),
        );
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
