
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutm_food_app/features/auth/model/user.dart';
import 'package:nutm_food_app/locator.dart';
import 'package:nutm_food_app/service/auth_service.dart';
import 'package:nutm_food_app/service/secure_storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authService = locator<AuthService>();
  final secureStorage = locator<SecureStorage>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is AppStarted) {
        _mapEventToState(event);
      }
      if (event is LoggedIn) {
        _mapLoggedInToState(event);
      }
      if (event is LoggedOut) {
       _mapLogoutToState(event);
      }
    });
  }

  Stream<AuthState> _mapEventToState(AppStarted event) async* {
    yield AuthLoading();

    try {
      final hasToken = await secureStorage.hasToken();
      final token = await secureStorage.getToken();
      if (hasToken) {
        yield AuthAuthenticated(
            user: User(email: '', name: '', password: '', token: token!));
      } else {
        yield AuthNotAuthenticated();
      }
    } catch (e) {
      yield AuthFailed(message: e.toString());
    }
  }

  Stream<AuthState> _mapLoggedInToState(LoggedIn event) async* {
    yield AuthAuthenticated(user: event.user);
  }

  Stream<AuthState> _mapLogoutToState(LoggedOut event) async* {
    await secureStorage.deleteAll();
    yield AuthNotAuthenticated();
  }
}
