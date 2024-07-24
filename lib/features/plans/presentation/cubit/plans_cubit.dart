import 'package:ai_financial_manager/features/plans/domain/models/plan_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/plans_params.dart';
import '../../domain/plans_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'plans_cubit.freezed.dart';
part 'plans_state.dart';

@injectable
class PlansCubit extends Cubit<PlansState> {
  PlansCubit(this._repo) : super(const PlansState.initial());

  final IPlansRepo _repo;
  final params = PlansParams();

  void rest() {
    params.reset();
  }

  Future<void> getPlans() async {}
}
