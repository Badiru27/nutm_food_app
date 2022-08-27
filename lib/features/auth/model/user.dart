import 'package:equatable/equatable.dart';

class User extends Equatable {
  final Person person;
  final String token;
  const User({
    required this.person,
    required this.token,
  });

  @override
  List<Object?> get props => [person, token];

  Map<String, dynamic> toJson() {
    return {
      'user': person.toJson(),
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      person: Person.fromJson(map['user']),
      token: map['token'] ?? '',
    );
  }
}

class Person extends Equatable {
  final String email;
  final String name;
  final String password;
  const Person({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  List<Object?> get props => [email, name, password];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  factory Person.fromJson(Map<String, dynamic> map) {
    return Person(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
