


import 'package:injectable/injectable.dart';

import '../domain/plans_repo.dart';
import 'plans_remote_ds.dart';

@LazySingleton(as: IPlansRepo)
class PlansRepoImpl implements IPlansRepo{
  const PlansRepoImpl(
    this._remoteDS,
  );
  final IPlansRemoteDS _remoteDS;

}