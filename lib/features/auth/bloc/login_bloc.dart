import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutm_food_app/app/bloc/auth_bloc.dart';
import 'package:nutm_food_app/service/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;
  final AuthBloc _authBloc;

  LoginBloc({required AuthBloc authBloc, required AuthService authService})
      : _authBloc = authBloc,
        _authService = authService,
        super(LoginInitial()) {
    on<LoginInButtonPressed>(_onLoggedInButtonPressed);
  }

  FutureOr<void> _onLoggedInButtonPressed(
      LoginInButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final user = await _authService.logIn(
          email: event.email, password: event.password);
      if (user != null) {
        _authBloc.add(LoggedIn(user: user));
        emit(LoginSuccess());
        emit(LoginInitial());
      } else {
         emit(const LoginFailure(error: 'Some wired just happen'));
      }
    } catch (e) {
       emit(LoginFailure(error: e.toString()));
    }
  }
}
