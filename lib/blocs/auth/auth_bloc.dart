import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:equatable/equatable.dart';
import '../../models/models.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unauthenticated()) {
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);

    _userSubscription = _authRepository.user.listen(
      (user) => add(
        AuthUserChanged(user: user),
      ),
    );
  }

  void _onUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(AuthState.authenticated(user: event.user));
  }

  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    unawaited(_authRepository.logOut());
  }
}
