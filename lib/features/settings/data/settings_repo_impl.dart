import 'package:injectable/injectable.dart';

import '../domain/settings_repo.dart';
import 'settings_remote_ds.dart';

@LazySingleton(as: ISettingsRepo)
class SettingsRepoImpl implements ISettingsRepo {
  const SettingsRepoImpl(
    this._remoteDS,
  );
  final ISettingsRemoteDS _remoteDS;
}
