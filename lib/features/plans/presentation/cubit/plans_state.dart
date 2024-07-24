part of 'plans_cubit.dart';

@freezed
class PlansState with _$PlansState{
const factory PlansState.initial() = _Initial;
const factory PlansState.loading() = _Loading;
const factory PlansState.error(String message) = _Error;
const factory PlansState.gotPlans(List<PlanModel> plans) = _GotPlans;
}