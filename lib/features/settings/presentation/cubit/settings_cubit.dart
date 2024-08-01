import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/settings_params.dart';
import '../../domain/settings_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._repo) : super(const SettingsState.initial());

  final ISettingsRepo _repo;
  final params = SettingsParams();

  void rest() {
    params.reset();
  }

  
}
