import 'dart:convert';
import 'package:nutm_food_app/constant/app_api.dart';
import 'package:nutm_food_app/service/api_service.dart';
import 'package:nutm_food_app/service/auth_service.dart';
import 'package:nutm_food_app/service/local_storage.dart';
import 'package:nutm_food_app/util/respose_message.dart';

class FoodService {
  final ApiService apiService;
  final LocalStorageService localStorageService;
  AuthService authService;
  FoodService(
      {required this.apiService,
      required this.localStorageService,
      required this.authService});

  static const mealKey = 'meal';

  Future<ResponseMessage> signFood() async {
    try {
      final result = await apiService.post(
          headers: await authService.getAuthorizationHeader(),
          body: {},
          url: AppApiEndpoint.signFoodURI);
      return ResponseMessage.fromJson(result);
    } catch (e) {
      return ResponseMessage(success: false, message: 'Something went wrong');
    }
  }

  Future<void> saveUserCurrentMeal(String day) async {
    localStorageService.saveToDisk(mealKey, jsonEncode(day));
  }

  Future<String> getUserCurrentMeal() async {
    final result =
        await jsonDecode(localStorageService.getFromDisk(mealKey).toString());
    if (result == null) return '';
    return result;
  }
}
