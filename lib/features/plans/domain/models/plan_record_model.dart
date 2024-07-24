import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:isar/isar.dart';

part 'plan_record_model.g.dart';

@collection
class PlanRecord extends MoneyRecordABS {
  double recordBadgetOnTime;
  PlanRecord({
    required super.amount,
    super.createdOn_,
    required this.recordBadgetOnTime,
  });

  @override
  String getAmount() {
    // TODO: implement getAmount
    throw UnimplementedError();
  }

  @override
  String getIcon() {
    // TODO: implement getIcon
    throw UnimplementedError();
  }

  @override
  String getLabel() {
    // TODO: implement getLabel
    throw UnimplementedError();
  }
}
