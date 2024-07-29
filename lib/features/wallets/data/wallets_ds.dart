import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/core/services/db.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class IWalletsDS {
  Future<(List<WalletModel>, QuerySorted<WalletModel>)> getWalletsStream();
  void addWallet(WalletModel wallet);

  void deleteWallet(int id);
}

@LazySingleton(as: IWalletsDS)
class WalletsDSImpl implements IWalletsDS {
  const WalletsDSImpl();

  @override
  void addWallet(WalletModel wallet) {
    DB.isar.writeTxn(() async => DB.isar.walletModels.put(wallet));
  }

  @override
  Future<(List<WalletModel>, QuerySorted<WalletModel>)> getWalletsStream() async {
    final query = DB.isar.walletModels.where();
    final wallets = await query.findAll();
    query.watch();
    return (wallets, query);
  }

  @override
  void deleteWallet(int id) {
    DB.isar.writeTxn(() async => DB.isar.walletModels.delete(id));
  }
}
