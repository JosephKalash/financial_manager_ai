import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/core/utils/date_utlils.dart';
import 'package:isar/isar.dart';

part 'plan_record_model.g.dart';

@collection
// ignore: must_be_immutable
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
    return DateUtils.formatDate(createdAt, pattern: 'd/M/y');
  }
}
