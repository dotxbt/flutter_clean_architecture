import 'package:intl/intl.dart';

String toRupiah(int number) {
  return NumberFormat.simpleCurrency(
          locale: 'id_ID', decimalDigits: 0, name: "Rp ")
      .format(number)
      .toString();
}
