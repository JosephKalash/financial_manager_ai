import 'package:ai_financial_manager/core/logical/abstract/money_record_abs.dart';
import 'package:ai_financial_manager/features/record/domain/models/category_model.dart';
import 'package:ai_financial_manager/features/record/domain/models/record_model.dart';
import 'package:ai_financial_manager/features/record/presentation/widgets/balance_widget.dart';
import 'package:ai_financial_manager/features/record/presentation/widgets/expenses_incomes_widget.dart';
import 'package:ai_financial_manager/features/record/presentation/widgets/record_list.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/transfer_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_model.dart';
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
  final records = <DateTime, List<MoneyRecordABS>>{};
  final double expenses = 1000;
  final double incomes = 6000;
  late final double balance = incomes - expenses;
  @override
  void initState() {
    final date = DateTime.now();
    records[date] = [];
    final record = RecordModel(amount: 1000);
    record.category.value = CategoryModel(name: 'food', isExpences: true, icon: Assets.assetsIconsFood);
    record.wallet.value = WalletModel(name: 'Cash', icon: Assets.assetsIconsCashWallet);
    records[date]!.add(record);
    final record2 = RecordModel(amount: 2000);
    record2.category.value = CategoryModel(name: 'test', isExpences: false, icon: Assets.assetsIconsSalary);
    record2.wallet.value = WalletModel(name: 'Cash', icon: Assets.assetsIconsCashWallet);
    records[date]!.add(record2);
    final transfer = TransferModel(amount: 500);
    transfer.fromWallet.value = WalletModel(name: 'Cash', icon: Assets.assetsIconsCashWallet);
    transfer.toWallet.value = WalletModel(name: 'Card', icon: Assets.assetsIconsBankCard);
    records[date]!.add(transfer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.h.hSpace,
        BalanceWidget(balance: balance),
        10.h.hSpace,
        ExpensesIncomesWidget(expenses: expenses, incomes: incomes),
        30.h.hSpace,
        RecordsList(records: records),
      ],
    );
  }
}
