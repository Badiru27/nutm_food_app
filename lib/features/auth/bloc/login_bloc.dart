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
    on<LogOutButtonPressed>(_onLoggedOutButtonPressed);
    on<PasswordIconTapped>(_onPasswordIconTapped);

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
         emit(const LoginFailure(error: 'Invalid credentials'));
      }
    } catch (e) {
       emit( const LoginFailure(error: 'It\'s not your fault, it\'s our fault'));
    }
  }

  FutureOr<void> _onLoggedOutButtonPressed(LogOutButtonPressed event, Emitter<LoginState> emit) {
    _authService.deleteUser();
    _authBloc.add(LoggedOut());
    emit(LoginInitial());
  }

  FutureOr<void> _onPasswordIconTapped(PasswordIconTapped event, Emitter<LoginState> emit) {
    emit(IsObscured(isObscured: !state.isObscured));
  }
}
