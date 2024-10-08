part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState{
const factory SettingsState.initial() = _Initial;
const factory SettingsState.loading() = _Loading;
const factory SettingsState.error(String message) = _Error;
}