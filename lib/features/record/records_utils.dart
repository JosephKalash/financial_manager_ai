import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';

class RecordsUtils {
  RecordsUtils._();

  static double getExpences(List<RecordModel> records, {int? month}) {
    return records
        .where(
          (element) => element.category.value!.isExpences && (month != null ? element.createdAt.month == month : true),
        )
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  static double getIncomes(List<RecordModel> records, {int? month}) {
    return records
        .where(
          (element) => !element.category.value!.isExpences && (month != null ? element.createdAt.month == month : true),
        )
        .fold(0, (previousValue, element) => previousValue + element.amount);
  }

  static Map<String, double> getExpensesPerCategory(List<RecordModel> records, {int? month}) {
    final filteredRecords = records.where(
      (record) => record.category.value!.isExpences && (month != null ? record.createdAt.month == month : true),
    );

    return filteredRecords.fold(
      <String, double>{},
      (result, record) {
        final categoryName = record.category.value!.name;
        result[categoryName] = (result[categoryName] ?? 0) + record.amount;
        return result;
      },
    );
  }

  static Map<String, double> getIncomesPerCategory(List<RecordModel> records, {int? month}) {
    final filteredRecords = records.where(
      (record) => !record.category.value!.isExpences && (month != null ? record.createdAt.month == month : true),
    );

    return filteredRecords.fold(
      <String, double>{},
      (result, record) {
        final categoryName = record.category.value!.name;
        result[categoryName] = (result[categoryName] ?? 0) + record.amount;
        return result;
      },
    );
  }

  static Map<int, double> getExpencesPerDay(List<RecordModel> records, {int? month}) {
    final filteredRecords = records.where(
      (record) => record.category.value!.isExpences && (month != null ? record.createdAt.month == month : true),
    );

    return filteredRecords.fold(
      <int, double>{},
      (result, record) {
        final day = record.createdAt.day;
        result[day] = (result[day] ?? 0) + record.amount;
        return result;
      },
    );
  }
}
