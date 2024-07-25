import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/core/utils/funcs.dart';
import 'package:isar/isar.dart';

part 'plan_record_model.g.dart';

@collection
class PlanRecordModel extends MoneyRecordABS {
  double badgetOnRecordTime;
  PlanRecordModel({
    required super.amount,
    super.createdAt_,
    required this.badgetOnRecordTime,
  });

  @override
  String getAmount() {
    return switch (amount >= 0) {
      true => '+$amount',
      false => '-$amount',
    };
  }

  @override
  String getIcon() {
    return '';
  }

  @override
  String getLabel() {
    return formatDate(createdAt, pattern: 'd/M/y');
  }
}
