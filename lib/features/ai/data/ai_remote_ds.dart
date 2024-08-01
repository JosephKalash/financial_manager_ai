
import '../domain/ai_params.dart';
import '../domain/ai_model.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


abstract class IAiRemoteDS{
}


@LazySingleton(as: IAiRemoteDS)
class AiRemoteDSImpl implements IAiRemoteDS{
  const AiRemoteDSImpl(this._dio);
  final Dio _dio;

 
}