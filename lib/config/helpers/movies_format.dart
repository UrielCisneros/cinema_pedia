import 'package:intl/intl.dart';

class MovieFormat {
  static String viewMovieFormat(double number) {
    final format = NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
        .format(number);
    return format;
  }
}
