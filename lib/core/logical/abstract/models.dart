import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

import '../errors/failures.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef QuerySorted<T> = QueryBuilder<T, T, QQueryProperty>;
typedef QueryWhere<T> = QueryBuilder<T, T, QWhere>;

abstract class Serializer {
  Map<String, dynamic> toJson();
  void reset();
}

class GeneralParams {
  int? pageSize;
  int? pageNumber;
  DateTime? lastUpdateAt;
  String? orderBy, fields, id;
  String? user;
  GeneralParams({
    this.pageSize,
    this.pageNumber,
    this.fields,
    this.orderBy,
    this.lastUpdateAt,
  });
  Map<String, dynamic> toJson() => {
        'num_item_in_page': pageSize,
        'page': pageNumber,
        'order_by': orderBy,
        'user': user,
        'last_update': lastUpdateAt?.toUtc().toIso8601String(),
      }..removeWhere((key, value) => value == null);
  reset() {
    pageNumber = 1;
    pageSize = 15;
    fields = orderBy = null;
  }

  orderByCreatedAt([desc = true]) {
    orderBy = 'created_at';
    if (desc) orderBy = '-${orderBy!}';
  }
}
