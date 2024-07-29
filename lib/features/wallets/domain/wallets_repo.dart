import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/features/wallets/domain/models/wallet_model.dart';

abstract class IWalletsRepo {
  Future<(List<WalletModel>, QuerySorted<WalletModel>)> getWalletsStream();
  void addWallet(WalletModel wallet);
  void deleteWallet(int id);
}
