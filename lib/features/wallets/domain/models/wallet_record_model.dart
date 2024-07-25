
import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:isar/isar.dart';

part 'wallet_record_model.g.dart';

@collection
class WalletRecordModel extends MoneyRecordABS {
  double amountOnRecordTime;
  WalletRecordModel({
    required super.amount,
    super.createdAt_,
    required this.amountOnRecordTime,
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
    return 'update_balance'.tr();
  }
}
