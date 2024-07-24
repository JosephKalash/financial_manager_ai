import 'package:isar/isar.dart';

/// Id id = Isar.autoIncrement;
/// DateTime createdOn;
/// String? note;
abstract class MoneyRecordABS {
  Id id = Isar.autoIncrement;
  DateTime createdOn;
  String? note;
  double amount;
  MoneyRecordABS({DateTime? createdOn_, this.note, required this.amount}) : createdOn = createdOn_ ?? DateTime.now();

  String getIcon();
  String getAmount();
  String getLabel();
}
