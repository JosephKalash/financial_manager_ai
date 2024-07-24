import 'package:isar/isar.dart';

import '../../../wallets/domain/models/wallet_model.dart';
import 'category_model.dart';

part 'recuring_model.g.dart';

enum RecurringStatus {
  running,
  stopped,
  pending;
}

@collection
class RecurringModel {
  Id id = Isar.autoIncrement;
  final category = IsarLink<CategoryModel>();
  final wallet = IsarLink<WalletModel>();
  float amount;
  String? note;
  DateTime startDate;
  DateTime? endDate;
  int repeatedTimes;
  @enumerated
  RecurringStatus status;

  RecurringModel({
    required this.amount,
    required this.startDate,
    required this.status,
    this.note,
    this.endDate,
    this.repeatedTimes = 0,
  });
}
