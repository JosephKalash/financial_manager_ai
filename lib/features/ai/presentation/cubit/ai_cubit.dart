import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/ai_params.dart';
import '../../domain/ai_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'ai_cubit.freezed.dart';
part 'ai_state.dart';

@injectable
class AiCubit extends Cubit<AiState> {
  AiCubit(this._repo) : super(const AiState.initial());

  final IAiRepo _repo;
  final params = AiParams();

  void rest() {
    params.reset();
  }

}
