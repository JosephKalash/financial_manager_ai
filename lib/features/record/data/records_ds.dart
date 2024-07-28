import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/core/services/db.dart';
import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/recurring_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class IRecordsDS {
  Future<(List<RecordModel>, QueryType<RecordModel>)> getRecordsStream();
  Future<(List<TransferModel>, QueryType<TransferModel>)> getTransfersStream();
  Future<(List<WalletRecordModel>, QueryType<WalletRecordModel>)> getWalletRecordsStream();
  Future<(List<PlanRecordModel>, QueryType<PlanRecordModel>)> getPlanRecordsStream();
  Future<(List<RecurringModel>, QueryType<RecurringModel>)> getRecurringStream();
  void addRecord(RecordModel record);
  void addTransfer(TransferModel transfer);
  void addRecurring(RecurringModel recurring);
}

@LazySingleton(as: IRecordsDS)
class RecordsDSImpl implements IRecordsDS {
  RecordsDSImpl();

  @override
  Future<(List<PlanRecordModel>, QueryType<PlanRecordModel>)> getPlanRecordsStream() async {
    final query = DB.isar.planRecordModels.where().sortByCreatedAtDesc();
    final data = await query.findAll();
    return (data, query);
  }

  @override
  Future<(List<RecordModel>, QueryType<RecordModel>)> getRecordsStream() async {
    final query = DB.isar.recordModels.where().sortByCreatedAtDesc();
    final data = await query.findAll();
    return (data, query);
  }

  @override
  Future<(List<TransferModel>, QueryType<TransferModel>)> getTransfersStream() async {
    final query = DB.isar.transferModels.where().sortByCreatedAtDesc();
    final data = await query.findAll();
    return (data, query);
  }

  @override
  Future<(List<WalletRecordModel>, QueryType<WalletRecordModel>)> getWalletRecordsStream() async {
    final query = DB.isar.walletRecordModels.where().sortByCreatedAtDesc();
    final data = await query.findAll();
    return (data, query);
  }

  @override
  void addRecord(RecordModel record) {
    DB.isar.writeTxn(() async => DB.isar.recordModels.put(record));
  }

  @override
  void addRecurring(RecurringModel recurring) {
    DB.isar.writeTxn(() async => DB.isar.recurringModels.put(recurring));
  }

  @override
  void addTransfer(TransferModel transfer) {
    DB.isar.writeTxn(() async => DB.isar.transferModels.put(transfer));
  }

  @override
  Future<(List<RecurringModel>, QueryType<RecurringModel>)> getRecurringStream() async {
    final query = DB.isar.recurringModels.where();
    final data = await query.findAll();
    return (data, query);
  }
}
