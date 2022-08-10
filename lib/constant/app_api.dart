class AppApiEndpoint{

   const AppApiEndpoint._();

  static const String scheme = 'https';
  static const String host = 'localhost:3000/api/v1';
  static const int receiveTimeout = 3000;
  static const int sendTimeout = 5000;

  static Uri baseUri =
      Uri(scheme: scheme, host: host, path: '/');

  static Uri registerURI =  baseUri.replace(path: '/auth/register');
  static Uri loginURI =  baseUri.replace(path: '/auth/login');
  static Uri signFoodURI =  baseUri.replace(path: '/food');
  static Uri getAllMonthFoodURI(String month) => baseUri.replace(path: '/food/$month');
  static Uri getAllVendorMonthFoodURI(String month, String meal) => baseUri.replace(path: '/food/$month/vendor/$meal');
  static Uri getAllVendorFoodURI(String date, String meal) => baseUri.replace(path: '/food/$date/vendor/$meal');
  static Uri getAllDayFoodURI(String date) => baseUri.replace(path: '/food/$date/vendor');

}