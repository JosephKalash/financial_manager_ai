

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


abstract class ISettingsRemoteDS{
}


@LazySingleton(as: ISettingsRemoteDS)
class SettingsRemoteDSImpl implements ISettingsRemoteDS{
  const SettingsRemoteDSImpl(this._dio);
  final Dio _dio;
}