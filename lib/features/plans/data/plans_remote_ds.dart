
import 'package:injectable/injectable.dart';

abstract class IPlansRemoteDS {
}

@LazySingleton(as: IPlansRemoteDS)
class PlansRemoteDSImpl implements IPlansRemoteDS {
  const PlansRemoteDSImpl();
}
