import 'package:ai_financial_manager/core/UI/widgets/custom_widgets/custom_widgets.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExpensesIncomesWidget extends StatelessWidget {
  const ExpensesIncomesWidget({
    super.key,
    required this.expenses,
    required this.incomes,
  });

  final double expenses;
  final double incomes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ValueHolderWidget(
              color: AppColors.primary,
              title: 'expenses',
              value: expenses,
            ).expanded(),
            15.w.wSpace,
            ValueHolderWidget(
              color: AppColors.green,
              title: 'incomes',
              value: incomes,
            ).expanded(),
          ],
        ),
        10.h.hSpace,
        LinearProgressIndicator(
          value: expenses / incomes,
          backgroundColor: AppColors.green,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          minHeight: 2,
          borderRadius: 25.radius,
        ).opacity(.9),
      ],
    );
  }
}

class ValueHolderWidget extends StatelessWidget {
  const ValueHolderWidget({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  final Color color;
  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: 20.radius,
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextTr(
            title,
            style: labelStyle(color: AppColors.white, isBold: true),
          ),
          Text(
            formatCurrency(value),
            style: titleStyle(color: AppColors.white, size: 28),
          ).flexible(),
        ],
      ),
    );
  }
}
