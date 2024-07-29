import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/recurring_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';

abstract class IRecordsRepo {
  Future<(List<RecordModel>, QuerySorted<RecordModel>)> getRecordsStream();
  Future<(List<TransferModel>, QuerySorted<TransferModel>)> getTransfersStream();
  Future<(List<WalletRecordModel>, QuerySorted<WalletRecordModel>)> getWalletRecordsStream();
  Future<(List<PlanRecordModel>, QuerySorted<PlanRecordModel>)> getPlanRecordsStream();
  Future<(List<RecurringModel>, QuerySorted<RecurringModel>)> getRecurringStream();
  //adding
  void addRecord(RecordModel record);
  void addTransfer(TransferModel transfer);
  void addRecurring(RecurringModel recurring);
  //deleting
  void deleteRecord(int id);
  void deleteTransfer(int id);
  void deleteRecurring(int id);
}
