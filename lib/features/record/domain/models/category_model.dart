import 'package:isar/isar.dart';

part 'category_model.g.dart';

@collection
class CategoryModel {
  Id id = Isar.autoIncrement;
  String name;
  String? icon;
  bool isExpenses;
  float? defaultAmount;

  CategoryModel({
    required this.name,
    required this.isExpenses,
    this.icon,
    this.defaultAmount,
  });
}
