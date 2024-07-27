import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';
import 'package:isar/isar.dart';

abstract class IRecordsRepo {
  Future<(List<RecordModel>, QueryBuilder<RecordModel, RecordModel, QAfterSortBy>)> getRecordsStream();
  Future<(List<TransferModel>, QueryBuilder<TransferModel, TransferModel, QAfterSortBy>)> getTransfersStream();
  Future<(List<WalletRecordModel>, QueryBuilder<WalletRecordModel, WalletRecordModel, QAfterSortBy>)> getWalletRecordsStream();
  Future<(List<PlanRecordModel>, QueryBuilder<PlanRecordModel, PlanRecordModel, QAfterSortBy>)> getPlanRecordsStream();
}
