import 'package:injectable/injectable.dart';

abstract class IRecordsDS {}

@LazySingleton(as: IRecordsDS)
class RecordsDSImpl implements IRecordsDS {
  RecordsDSImpl();
}
