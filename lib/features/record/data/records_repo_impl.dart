import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/recurring_model.dart';
import 'package:ai_financial_manager/features/record/domain/record_repo.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';
import 'package:injectable/injectable.dart';

import 'records_ds.dart';

@LazySingleton(as: IRecordsRepo)
class RecordsRepoImpl implements IRecordsRepo {
  const RecordsRepoImpl(this._ds);
  final IRecordsDS _ds;

  @override
  Future<(List<PlanRecordModel>, QueryType<PlanRecordModel>)> getPlanRecordsStream() {
    return _ds.getPlanRecordsStream();
  }

  @override
  Future<(List<RecordModel>, QueryType<RecordModel>)> getRecordsStream() {
    return _ds.getRecordsStream();
  }

  @override
  Future<(List<TransferModel>, QueryType<TransferModel>)> getTransfersStream() {
    return _ds.getTransfersStream();
  }

  @override
  Future<(List<WalletRecordModel>, QueryType<WalletRecordModel>)> getWalletRecordsStream() {
    return _ds.getWalletRecordsStream();
  }

  @override
  void addRecord(RecordModel record) {
    return _ds.addRecord(record);
  }

  @override
  void addRecurring(RecurringModel recurring) {
    return _ds.addRecurring(recurring);
  }

  @override
  void addTransfer(TransferModel transfer) {
    return _ds.addTransfer(transfer);
  }

  @override
  Future<(List<RecurringModel>, QueryType<RecurringModel>)> getRecurringStream() {
    return _ds.getRecurringStream();
  }
}
