part of 'wallets_cubit.dart';

@freezed
class WalletsState with _$WalletsState{
const factory WalletsState.initial() = _Initial;
const factory WalletsState.loading() = _Loading;
const factory WalletsState.error(String message) = _Error;
const factory WalletsState.updated() = _Updated;
}