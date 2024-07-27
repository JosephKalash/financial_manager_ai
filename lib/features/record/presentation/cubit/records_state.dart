part of 'records_cubit.dart';

@freezed
class RecordsState with _$RecordsState {
  const factory RecordsState.initial() = _Initial;
  const factory RecordsState.loading() = _Loading;
  const factory RecordsState.error(String message) = _Error;
  const factory RecordsState.udpated(Map<DateTime, List<MoneyRecordABS>> allRecords) = _Updated;
}
