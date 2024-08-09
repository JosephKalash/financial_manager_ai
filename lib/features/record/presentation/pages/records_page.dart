import 'package:ai_financial_manager/features/record/presentation/widgets/balance_widget.dart';
import 'package:ai_financial_manager/features/record/presentation/widgets/expenses_incomes_widget.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecordsPage extends StatefulWidget {
  const RecordsPage();
  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  final double expenses = 1000;
  final double incomes = 6000;
  late final double balance = incomes - expenses;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.h.hSpace,
        BalanceWidget(balance: balance),
        20.h.hSpace,
        ExpensesIncomesWidget(expenses: expenses, incomes: incomes),
      ],
    );
  }
}