import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/record_repo.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import 'records_ds.dart';

@LazySingleton(as: IRecordsRepo)
class RecordsRepoImpl implements IRecordsRepo {
  const RecordsRepoImpl(
    this._remoteDS,
  );
  final IRecordsDS _remoteDS;

  @override
  Future<(List<PlanRecordModel>, QueryBuilder<PlanRecordModel, PlanRecordModel, QAfterSortBy>)> getPlanRecordsStream() {
    // TODO: implement getPlanRecordsStream
    throw UnimplementedError();
  }

  @override
  Future<(List<RecordModel>, QueryBuilder<RecordModel, RecordModel, QAfterSortBy>)> getRecordsStream() {
    // TODO: implement getRecordsStream
    throw UnimplementedError();
  }

  @override
  Future<(List<TransferModel>, QueryBuilder<TransferModel, TransferModel, QAfterSortBy>)> getTransfersStream() {
    // TODO: implement getTransfersStream
    throw UnimplementedError();
  }

  @override
  Future<(List<WalletRecordModel>, QueryBuilder<WalletRecordModel, WalletRecordModel, QAfterSortBy>)>
      getWalletRecordsStream() {
    // TODO: implement getWalletRecordsStream
    throw UnimplementedError();
  }
}
