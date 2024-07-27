import 'package:ai_financial_manager/features/plans/domain/models/plan_model.dart';
import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/category_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/recuring_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

abstract final class DB {
  static late Isar isar;
  static Future<void> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.getInstance('isarIntance') != null) {
      isar = Isar.getInstance('isarIntance')!;
    } else
      isar = await Isar.open(
        [
          PlanModelSchema,
          PlanRecordModelSchema,
          CategoryModelSchema,
          RecurringModelSchema,
          WalletModelSchema,
          RecordModelSchema,
          TransferModelSchema,
          WalletRecordModelSchema,
        ],
        directory: dir.path,
        name: 'appdb',
        inspector: kDebugMode,
      );
  }
  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
