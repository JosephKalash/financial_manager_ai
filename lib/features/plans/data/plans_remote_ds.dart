
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IPlansRemoteDS {
}

@LazySingleton(as: IPlansRemoteDS)
class PlansRemoteDSImpl implements IPlansRemoteDS {
  const PlansRemoteDSImpl(this._dio);
  final Dio _dio;
}
