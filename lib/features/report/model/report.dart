import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nutm_food_app/features/auth/model/user.dart';

class FoodReport extends Equatable {
  final String meal;
  final String foodId;
  final List<Person> person;
  final int totalPerson;
  const FoodReport({
    required this.meal,
    required this.foodId,
    required this.person,
    required this.totalPerson,
  });

  @override
  List<Object?> get props => [meal, foodId];

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'meal': meal});
    result.addAll({'foodId': foodId});
    result.addAll({'users': person.map((x) => x.toJson()).toList()});
    result.addAll({'totalUsers': totalPerson});

    return result;
  }

  factory FoodReport.fromJson(Map<String, dynamic> map) {
    return FoodReport(
      meal: map['meal'] ?? '',
      foodId: map['foodId'] ?? '',
      person: List<Person>.from(map['users']?.map((x) => Person.fromJson(x))),
      totalPerson: map['totalUsers']?.toInt() ?? 0,
    );
  }

}
