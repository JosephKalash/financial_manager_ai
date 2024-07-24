import 'package:isar/isar.dart';

part 'wallet_model.g.dart';

@collection
class WalletModel {
  Id id = Isar.autoIncrement;
  String name;
  String? icon;
  double? amount;
  String? note;

  WalletModel({
    required this.name,
    this.icon,
    this.amount,
    this.note,
  });
}
