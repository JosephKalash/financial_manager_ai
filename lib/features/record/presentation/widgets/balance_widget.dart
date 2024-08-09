import 'package:ai_financial_manager/core/UI/widgets/custom_widgets/custom_widgets.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.balance,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextTr('balance', style: titleStyle(color: AppColors.black)),
        4.wSpace,
        Text(balance.toOneDecimal, style: titleStyle()),
        const Spacer(),
        TextTr(
          DateTime.now().format('yyyy-m'),
          style: labelStyle(color: AppColors.black),
        ),
      ],
    ).padding(horizontal: 4.w);
  }
}
