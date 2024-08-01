


import 'package:injectable/injectable.dart';

import '../../../core/logical/abstract/models.dart';
import '../domain/ai_params.dart';
import '../domain/ai_model.dart';
import '../domain/ai_repo.dart';
import 'ai_remote_ds.dart';
import '../../../core/logical/abstract/repository.dart';

@LazySingleton(as: IAiRepo)
class AiRepoImpl implements IAiRepo{
  const AiRepoImpl(
    this._remoteDS,
  );
  final IAiRemoteDS _remoteDS;

}