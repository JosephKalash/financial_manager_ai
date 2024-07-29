import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_model.dart';
import 'package:ai_financial_manager/features/wallets/domain/wallets_repo.dart';
import 'package:injectable/injectable.dart';

import 'wallets_ds.dart';

@LazySingleton(as: IWalletsRepo)
class WalletsRepoImpl implements IWalletsRepo {
  const WalletsRepoImpl(this._ds);
  final IWalletsDS _ds;

  @override
  void addWallet(WalletModel wallet) {
    return _ds.addWallet(wallet);
  }

  @override
  Future<(List<WalletModel>, QuerySorted<WalletModel>)> getWalletsStream() {
    return _ds.getWalletsStream();
  }
  
  @override
  void deleteWallet(int id) {
    return _ds.deleteWallet(id);
  }
}
