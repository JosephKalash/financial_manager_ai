import 'package:isar/isar.dart';

part 'plan_model.g.dart';

enum PlanStatus {
  ingoing,
  finished,
}

@collection
class PlanModel {
  Id id = Isar.autoIncrement;
  String name;
  String? icon;
  double? targetedBudget;
  double? currentBudget;
  DateTime startDate;
  DateTime? endDate;
  String? note;
  @enumerated
  PlanStatus status = PlanStatus.ingoing;

  PlanModel({
    required this.name,
    required this.startDate,
    this.icon,
    this.targetedBudget,
    this.endDate,
    this.note,
  });
}

//TODO: create reacord model or used same record model to save money for a plan
//TODO: create moneyRecord interface for other model to implement