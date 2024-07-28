import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/core/utils/extensions.dart';
import 'package:ai_financial_manager/features/plans/domain/models/plan_record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/recurring_model.dart';
import 'package:ai_financial_manager/features/record/domain/record_repo.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_record_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'records_state.dart';
part 'records_cubit.freezed.dart';

@injectable
class RecordsCubit extends Cubit<RecordsState> {
  final IRecordsRepo _repo;
  RecordsCubit(this._repo) : super(const RecordsState.initial());

  Map<DateTime, List<MoneyRecordABS>> allRecords = {};

  List<RecurringModel> recurrings = [];
  List<RecordModel> records = [];
  List<WalletRecordModel> walletRecords = [];
  List<TransferModel> transferRecords = [];
  List<PlanRecordModel> planRecords = [];

  updateAllRecords() {
    final allList = [...records, ...walletRecords, ...transferRecords, ...planRecords]..sort();
    for (var record in allList) {
      allRecords[record.createdAt]!.add(record);
    }
    emit(const RecordsState.updated());
  }

  void addRecord(RecordModel record) {
    _repo.addRecord(record);
  }

  void addTransfer(TransferModel transfer) {
    _repo.addTransfer(transfer);
  }

  void addRecurring(RecurringModel recurring) {
    if (recurring.startDate.isSameDate(DateTime.now())) {
      addRecord(RecordModel(amount: recurring.amount, isRecurring: true));
      recurring.repeatedTimes++;
    }
    _repo.addRecurring(recurring);
  }

  void setupListners() async {
    await Future.wait([
      buildRecordsListner(),
      buildPlanRecordsListner(),
      buildWalletRecordsListner(),
      buildTransfersListner(),
    ]);
    emit(const RecordsState.updated());
  }

  void buildRecurringListner() async {
    final data = await _repo.getRecurringStream();
    recurrings = data.$1;
    emit(const RecordsState.updated());
    final stream = data.$2.watch();
    stream.listen((records) {
      recurrings = records;
      emit(const RecordsState.updated());
    });
  }

  Future buildRecordsListner() async {
    final data = await _repo.getRecordsStream();
    records = data.$1;
    final stream = data.$2.watch();
    stream.listen((records) {
      this.records = records;
      updateAllRecords();
    });
  }

  Future buildPlanRecordsListner() async {
    final data = await _repo.getPlanRecordsStream();
    planRecords = data.$1;
    final stream = data.$2.watch();
    stream.listen((records) {
      planRecords = records;
      updateAllRecords();
    });
  }

  Future buildWalletRecordsListner() async {
    final data = await _repo.getWalletRecordsStream();
    walletRecords = data.$1;
    final stream = data.$2.watch();
    stream.listen((records) {
      walletRecords = records;
      updateAllRecords();
    });
  }

  Future buildTransfersListner() async {
    final data = await _repo.getTransfersStream();
    transferRecords = data.$1;
    final stream = data.$2.watch();
    stream.listen((records) {
      transferRecords = records;
      updateAllRecords();
    });
  }
}
