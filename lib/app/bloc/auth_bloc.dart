import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutm_food_app/features/auth/model/user.dart';
import 'package:nutm_food_app/service/auth_service.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedOut>(_onLoggedOut);
    on<LoggedIn>(_onLoggedIn);
  }

  FutureOr<void> _onAppStarted(
      AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.getUser();
      if (user != null) {
        emit(AuthAuthenticated(
            user: User(
                person: user.person,
                token: user.token)));
      } else {
        emit(AuthNotAuthenticated());
      }
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }

  FutureOr<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async{
      await _authService.deleteUser();
      emit(AuthNotAuthenticated());
  }

  FutureOr<void> _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) {
    emit(AuthAuthenticated(user: event.user));
  }
}
