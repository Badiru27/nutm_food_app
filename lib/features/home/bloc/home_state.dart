part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final String meal;
  const HomeState({this.meal = "Breakfast"});

  @override
  List<Object> get props => [meal];
}

class HomeInitial extends HomeState {
}

class AlreadyGottenFood extends HomeState {
  const AlreadyGottenFood({required String meal}) : super(meal: meal);
  @override
  List<Object> get props => [meal];
}

class YetToGetFood extends HomeState {
  const YetToGetFood({required String meal}) : super(meal: meal);
  @override
  List<Object> get props => [meal];
}

class HomeLoading extends HomeState {
    const HomeLoading({required String meal}) : super(meal: meal);
  @override
  List<Object> get props => [meal];
}

class HomeFailure extends HomeState {
  final String error;

  const HomeFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class GetFoodSuccess extends HomeState {
  final String message;
  const GetFoodSuccess({required this.message});
  @override
  List<Object> get props => [message];
}
