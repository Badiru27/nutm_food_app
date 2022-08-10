import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nutm_food_app/service/api_service.dart';
import 'package:nutm_food_app/service/auth_service.dart';
import 'package:nutm_food_app/service/secure_storage_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {

  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl(Dio()));
  locator.registerLazySingleton<AuthService>(() => AuthService(apiService: locator()));
  locator.registerLazySingleton<SecureStorage>(() => SecureStorage());
}
