import 'package:intl/intl.dart';

class MovieFormat {
  static String viewMovieFormat(double number, [int decimals = 0]) {
    final format =
        NumberFormat.compactCurrency(decimalDigits: decimals, symbol: '')
            .format(number);
    return format;
  }
}
