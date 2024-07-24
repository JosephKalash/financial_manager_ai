import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:isar/isar.dart';

import 'wallet_model.dart';

class Transfer extends MoneyRecordABS {
  var fromWallet = IsarLink<WalletModel>();
  var toWallet = IsarLink<WalletModel>();

  Transfer({
    super.createdOn_,
    required super.amount,
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
