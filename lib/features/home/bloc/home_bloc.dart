import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutm_food_app/service/api_service.dart';
import 'package:nutm_food_app/service/auth_service.dart';
import 'package:nutm_food_app/service/food_service.dart';
import 'package:nutm_food_app/util/meal_time.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FoodService _foodService;
  HomeBloc({required FoodService foodService})
      : _foodService = foodService,
        super(HomeInitial()) {
    on<HomeLoaded>(_onHomeLoaded);
    on<GetFoodButtonPressed>(_onGetFoodButtonPressed);
  }

  FutureOr<void> _onGetFoodButtonPressed(
      GetFoodButtonPressed event, Emitter<HomeState> emit) async {
    emit(HomeLoading(meal: currentMeal()));
    final food = await _foodService.signFood();
    if (food.success == true) {
     _foodService.saveUserCurrentMeal(currentMeal());
      emit(GetFoodSuccess(message: food.message));
      emit(AlreadyGottenFood(meal: currentMeal()));
    } else if (food.success == false &&
        food.message != 'Something went wrong') {
      _foodService.saveUserCurrentMeal(currentMeal());
      emit(HomeFailure(error: food.message));
      emit(AlreadyGottenFood(meal: currentMeal()));
    } else {
      emit(HomeFailure(error: food.message));
    }
  }

  FutureOr<void> _onHomeLoaded(
      HomeLoaded event, Emitter<HomeState> emit) async {
    final userMeal = await _foodService.getUserCurrentMeal();
    final meal = currentMeal();
    if (userMeal == meal) {
      emit(AlreadyGottenFood(meal: meal));
    } else {
      emit(YetToGetFood(meal: meal));
    }
  }
}
