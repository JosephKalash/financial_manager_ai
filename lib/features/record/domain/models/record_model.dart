import 'package:isar/isar.dart';

import 'category_model.dart';
import '../../../../core/logical/abstract/money_record_abs.dart';

part 'record_model.g.dart';

@collection
class Record extends MoneyRecordABS {
  final cateogry = IsarLink<CategoryModel>();
  bool isRecurring;

  Record({
    required super.amount,
    this.isRecurring = false,
    super.createdOn_,
    super.note,
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
