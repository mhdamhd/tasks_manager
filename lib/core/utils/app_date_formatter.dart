import 'package:intl/intl.dart';

class DataFormatter {
  static DataFormatter? _instance;
  DataFormatter._();
  factory DataFormatter() => _instance ??= DataFormatter._();

  String formatDateDMMMYYYY(DateTime dateTime) =>
      DateFormat('d MMM, yyyy').format(dateTime);

  DateTime fromLinuxTime(String? date) => DateTime.fromMillisecondsSinceEpoch((int.tryParse(date ?? '') ?? 0) * 1000);

  String formatDatedMMMHms(DateTime dateTime) =>
      DateFormat('d MMM h:mm a').format(dateTime);
}
