import 'package:intl/intl.dart';

class AppFormatter {
  static var formatCurrency =
      NumberFormat.currency(locale: "en_US", symbol: "₦");

  static var formatCurrencyNoDecimal =
      NumberFormat.currency(locale: "en_US", symbol: "₦", decimalDigits: 0);
  static var formatNumber = NumberFormat.decimalPattern();

  static var dateFormatter = DateFormat('dd-MM-yyyy');
  static var monthYearFormatter = DateFormat('MM-yyyy');
  static var dateFormatterYMD = DateFormat('yyyy-MM-dd');
  static var dateFormatterMonth= DateFormat('MMM');

  static var kNumberFormat = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
  );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
