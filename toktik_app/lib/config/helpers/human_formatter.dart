import 'package:intl/intl.dart';

class HumanFormatter {
  static String toReadableNumber(double number) {
    final formatter =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '');

    return formatter.format(number);
  }
}
