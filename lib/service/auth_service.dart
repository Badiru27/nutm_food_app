import 'dart:convert';
import 'package:nutm_food_app/constant/app_api.dart';
import 'package:nutm_food_app/features/auth/model/user.dart';
import 'package:nutm_food_app/service/api_service.dart';
import 'package:nutm_food_app/service/food_service.dart';
import 'package:nutm_food_app/service/local_storage.dart';

class AuthService {
  final ApiService apiService;
  final LocalStorageService localStorageService;
  AuthService({required this.apiService, required this.localStorageService});

  static const userKey = 'user';

  Future<User?> logIn({required String email, required String password}) async {
    try {
      final result = await apiService.post(
          url: AppApiEndpoint.loginURI,
          body: {'email': email, 'password': password});
      final user = User.fromJson(result);
      await saveUserToStorage(user);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveUserToStorage(User user) async {
    localStorageService.saveToDisk(userKey, jsonEncode(user));
  }

  Future<User?> getUser() async {
    final result =
        await jsonDecode(localStorageService.getFromDisk(userKey).toString());
    if (result == null) return null;
    return User.fromJson(result);
  }

  Future<void> deleteUser() async {
    localStorageService.removeFromDisk(userKey);
    localStorageService.removeFromDisk(FoodService.mealKey);
  }

  Future<Map<String,String>> getAuthorizationHeader() async {
    final user = await getUser();
    return {
      'Authorization': 'Bearer ${user?.token}',
      'Content-Type': 'application/json',
    };
  }
}
