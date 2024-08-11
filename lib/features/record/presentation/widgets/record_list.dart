import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/features/record/presentation/widgets/record_widget.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'date_analysis_widget.dart';

class RecordsList extends StatelessWidget {
  const RecordsList({
    super.key,
    required this.records,
  });

  final Map<DateTime, List<MoneyRecordABS>> records;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: records.keys.length,
      itemBuilder: (_, i) {
        final date = records.keys.elementAt(i);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DateAnalysisWidget(date: date, records: records),
            20.h.hSpace,
            RecordWidget(records: records, date: date)
          ],
        );
      },
    );
  }
}
