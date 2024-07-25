import 'package:isar/isar.dart';

import 'category_model.dart';
import '../../../../core/logical/abstract/money_record_abs.dart';

part 'record_model.g.dart';

@collection
class RecordModel extends MoneyRecordABS {
  final category = IsarLink<CategoryModel>();
  bool isRecurring;

  RecordModel({
    required super.amount,
    this.isRecurring = false,
    super.createdAt_,
    super.note,
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
    return category.value!.icon ?? '';
  }

  @override
  String getLabel() {
    return category.value!.name;
  }
}
