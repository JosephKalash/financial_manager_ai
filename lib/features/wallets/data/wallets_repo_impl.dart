import 'package:ai_financial_manager/features/wallets/domain/wallets_repo.dart';
import 'package:injectable/injectable.dart';

import 'wallets_remote_ds.dart';

@LazySingleton(as: IWalletsRepo)
class WalletsRepoImpl implements IWalletsRepo {
  const WalletsRepoImpl(
    this._remoteDS,
  );
  final IWalletsRemoteDS _remoteDS;
}
