part of 'ai_cubit.dart';

@freezed
class AiState with _$AiState{
const factory AiState.initial() = _Initial;
const factory AiState.loading() = _Loading;
const factory AiState.error(String message) = _Error;
}