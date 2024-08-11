import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/records_utils.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:flutter/material.dart';

class DateTotalAmountPerDayWidget extends StatelessWidget {
  const DateTotalAmountPerDayWidget({
    super.key,
    required this.date,
    required this.records,
  });

  final DateTime date;
  final Map<DateTime, List<MoneyRecordABS>> records;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: AppColors.primary,
          height: 15,
          width: 3,
        ),
        10.w.wSpace,
        Text(
          date.format('EEE, d/M'),
          style: labelStyle(isBold: true, color: AppColors.black),
        ),
        const Spacer(),
        Text(
          formatCurrency(RecordsUtils.getExpences(
            records[date]!.whereType<RecordModel>().toList(),
          )),
          style: infoStyle(isBold: true, color: AppColors.primary),
        ),
        10.w.wSpace,
        Text(
          formatCurrency(RecordsUtils.getIncomes(
            records[date]!.whereType<RecordModel>().toList(),
          )),
          style: infoStyle(isBold: true, color: AppColors.green),
        )
      ],
    );
  }
}
