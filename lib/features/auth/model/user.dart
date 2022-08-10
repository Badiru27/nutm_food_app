import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String name;
  final String password;
  final String token;
  const User({
    required this.email,
    required this.name,
    required this.password,
    required this.token,
  });

  @override
  List<Object?> get props => [email, name, password, token];


  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'password': password});
    result.addAll({'token': token});

    return result;
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

}
