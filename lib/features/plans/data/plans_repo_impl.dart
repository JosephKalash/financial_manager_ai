


import 'package:injectable/injectable.dart';

import '../../../core/logical/abstract/models.dart';
import '../domain/plans_params.dart';
import '../domain/plans_repo.dart';
import 'plans_remote_ds.dart';
import '../../../core/logical/abstract/repository.dart';

@LazySingleton(as: IPlansRepo)
class PlansRepoImpl implements IPlansRepo{
  const PlansRepoImpl(
    this._remoteDS,
  );
  final IPlansRemoteDS _remoteDS;

  // @override
  // List<PlansModel> getAll(PlansParams params) {
  // }
}