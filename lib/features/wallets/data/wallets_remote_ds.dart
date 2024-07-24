import '../domain/wallets_params.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IWalletsRemoteDS {}

@LazySingleton(as: IWalletsRemoteDS)
class WalletsRemoteDSImpl implements IWalletsRemoteDS {
  const WalletsRemoteDSImpl();
}
