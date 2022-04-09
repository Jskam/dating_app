import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()..add(LoadUsers(users: User.users)),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dating App',
        routes: mainNavigation.routes,
        initialRoute: MainNavigationRouteNames.homeSreen,
        onGenerateRoute: mainNavigation.onGenerateRoute,
      ),
    );
  }
}
