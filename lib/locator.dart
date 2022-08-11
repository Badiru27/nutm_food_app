import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nutm_food_app/service/api_service.dart';
import 'package:nutm_food_app/service/auth_service.dart';
import 'package:nutm_food_app/service/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl(Dio()));
  locator.registerLazySingleton<AuthService>(
      () => AuthService(apiService: locator(), localStorageService: locator()));
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<LocalStorageService>(
      () => LocalStorageService(sharedPreferences));
}
