import 'package:ai_financial_manager/core/utils/funcs.dart';
import 'package:isar/isar.dart';

/// Id id = Isar.autoIncrement;
/// DateTime createdOn;
/// String? note;
abstract class MoneyRecordABS {
  Id id = Isar.autoIncrement;
  DateTime createdAt;
  String? note;
  double amount;
  MoneyRecordABS({DateTime? createdAt_, this.note, required this.amount}) : createdAt = createdAt_ ?? DateTime.now();

  String getIcon();
  String getAmount();
  String getLabel();

  String getCreatedAt() {
    return formatDate(createdAt, pattern: 'd/M/y');
  }
}
