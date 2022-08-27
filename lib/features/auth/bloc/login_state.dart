part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
    final bool isObscured;
  const LoginState({this.isObscured = true});

  @override
  List<Object> get props => [isObscured];
}


class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class IsObscured extends LoginState {
  const IsObscured({required bool isObscured}) : super(isObscured: isObscured);
  @override
  List<Object> get props => [isObscured];
}