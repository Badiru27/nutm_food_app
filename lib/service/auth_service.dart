import 'package:nutm_food_app/constant/app_api.dart';
import 'package:nutm_food_app/features/auth/model/user.dart';
import 'package:nutm_food_app/service/api_service.dart';

class AuthService {
  final ApiService apiService;
  AuthService({
    required this.apiService,
  });

  Future<User> logIn({required String email, required String password}) async {
    final result = await apiService.post(
        url: AppApiEndpoint.loginURI,
        body: {'email': email, 'password': password});

    return User.fromJson(result);
  }
}
