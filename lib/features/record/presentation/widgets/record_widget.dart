

import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({
    super.key,
    required this.records,
    required this.date,
  });

  final Map<DateTime, List<MoneyRecordABS>> records;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final record in records[date]!)
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: 12.radius,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  record.getIcon(),
                  height: 30,
                ).padding(all: 10).decorated(
                      color: AppColors.backgroundColor,
                      borderRadius: 8.radius,
                    ),
                10.w.wSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      record.getLabel(),
                      style: labelStyle(isBold: true),
                    ),
                    10.h.hSpace,
                    if (record is RecordModel)
                      Text(
                        record.wallet.value!.name,
                        style: infoStyle(color: AppColors.greyText),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  record.getAmount(),
                  style: labelStyle(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}