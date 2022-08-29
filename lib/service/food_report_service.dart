import 'package:nutm_food_app/constant/app_api.dart';
import 'package:nutm_food_app/features/report/model/report.dart';
import 'package:nutm_food_app/service/api_service.dart';
import 'package:nutm_food_app/service/auth_service.dart';

class FoodReportService {
  final ApiService apiService;
  final AuthService authService;
  FoodReportService({required this.apiService, required this.authService});

  Future<List<FoodReport>> getAllMonthFoodReport(String month) async {
    try {
      final result = await apiService.get(
          url: AppApiEndpoint.getAllMonthFoodURI(month),
          headers: await authService.getAuthorizationHeader());
      return result['data']
          .map<FoodReport>((e) => FoodReport.fromJson(e))
          .toList();
    } catch (e) {
      return <FoodReport>[];
    }
  }

  Future<List<FoodReport>> getAllVendorMonthFoodReport(
      String month, String meal) async {
    try {
      final result = await apiService.get(
          url: AppApiEndpoint.getAllVendorMonthFoodURI(month, meal),
          headers: await authService.getAuthorizationHeader());
      return result['data']
          .map<FoodReport>((e) => FoodReport.fromJson(e))
          .toList();
    } catch (e) {
      return <FoodReport>[];
    }
  }
}
