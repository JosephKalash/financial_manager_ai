import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:isar/isar.dart';

import 'wallet_model.dart';

part 'transfer_model.g.dart';

@collection
// ignore: must_be_immutable
class TransferModel extends MoneyRecordABS {
  var fromWallet = IsarLink<WalletModel>();
  var toWallet = IsarLink<WalletModel>();

  TransferModel({
    super.createdAt_,
    required super.amount,
    super.note,
  });

  @override
  String getAmount() {
    return amount.toStringAsFixed(2);
  }

  @override
  String getIcon() {
    //TODO
    return '';
  }

  @override
  String getLabel() {
    return 'transfer_label_'.tr(args: [
      fromWallet.value!.name,
      toWallet.value!.name,
    ]);
  }
}
