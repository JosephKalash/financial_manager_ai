import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/recurring_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';

abstract class IRecordsRepo {
  Future<(List<RecordModel>, QueryType<RecordModel>)> getRecordsStream();
  Future<(List<TransferModel>, QueryType<TransferModel>)> getTransfersStream();
  Future<(List<WalletRecordModel>, QueryType<WalletRecordModel>)> getWalletRecordsStream();
  Future<(List<PlanRecordModel>, QueryType<PlanRecordModel>)> getPlanRecordsStream();
  Future<(List<RecurringModel>, QueryType<RecurringModel>)> getRecurringStream();
  //adding
  void addRecord(RecordModel record);
  void addTransfer(TransferModel transfer);
  void addRecurring(RecurringModel recurring);
}
