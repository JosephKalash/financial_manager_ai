import 'package:ai_financial_manager/core/services/db.dart';
import 'package:ai_financial_manager/core/utils/date_utlils.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

/// Id id = Isar.autoIncrement;
/// DateTime createdOn;
/// String? note;
// ignore: must_be_immutable
abstract class MoneyRecordABS implements Comparable {
  late final Id id;
  @Index()
  DateTime createdAt;
  String? note;
  double amount;

  MoneyRecordABS({
    DateTime? createdAt_,
    this.note,
    required this.amount,
  })  : createdAt = createdAt_ ?? DateTime.now(),
        id = DB.fastHash(const Uuid().v4());

  String getIcon();
  String getAmount();
  String getLabel();

  String getCreatedAt(context) {
    return TimeOfDay.fromDateTime(createdAt).format(context);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MoneyRecordABS && runtimeType == other.runtimeType && id == other.id;

  @override
  @ignore
  int get hashCode => runtimeType.hashCode ^ id;

  @override
  int compareTo(other) {
    return createdAt.compareTo(other.createdAt);
  }
}
