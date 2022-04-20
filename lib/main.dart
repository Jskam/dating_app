import 'package:dating_app/blocs/auth/auth_bloc.dart';
import 'package:dating_app/blocs/images/images_bloc.dart';
import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/navigation.dart';
import 'package:dating_app/repositories/auth_repository.dart';
import 'package:dating_app/repositories/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => SwipeBloc()..add(LoadUsers(users: User.users)),
          ),
          BlocProvider(
            create: (_) => ImagesBloc(dataBaseRepository: DataBaseRepository())..add(LoadImages()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dating App',
          routes: mainNavigation.routes,
          initialRoute: MainNavigationRouteNames.onboardingScreen,
          onGenerateRoute: mainNavigation.onGenerateRoute,
        ),
      ),
    );
  }
}
