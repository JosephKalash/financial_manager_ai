
import 'package:injectable/injectable.dart';

abstract class IWalletsRemoteDS {}

@LazySingleton(as: IWalletsRemoteDS)
class WalletsRemoteDSImpl implements IWalletsRemoteDS {
  const WalletsRemoteDSImpl();
}
