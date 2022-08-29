class AppApiEndpoint{

   const AppApiEndpoint._();

  static const String scheme = 'https';
  static const String host = 'nutm-food-api.herokuapp.com';
  static const int receiveTimeout = 3000;
  static const int sendTimeout = 5000;
  static const apiExtension = '/api/v1';



  static Uri baseUri =
      Uri(scheme: scheme, host: host,  path: '/api/v1');

  static Uri registerURI =  baseUri.replace(path: '/api/v1/auth/register');
  static Uri loginURI =  baseUri.replace(path: '/api/v1/auth/login');
  static Uri signFoodURI =  baseUri.replace(path: '/api/v1/food');
  static Uri getAllMonthFoodURI(String month) => baseUri.replace(path: '/api/v1/food/all-month-food/$month');
  static Uri getAllVendorMonthFoodURI(String month, String meal) => baseUri.replace(path: '/api/v1/food/all-vendor-month-food/$month/vendor/$meal');
  static Uri getAllVendorFoodURI(String date, String meal) => baseUri.replace(path: '/api/v1/food/$date/vendor/$meal');
  static Uri getAllDayFoodURI(String date) => baseUri.replace(path: '/api/v1/food/$date/vendor');

}