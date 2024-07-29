import 'package:injectable/injectable.dart';

abstract class IPlansDS {}

@LazySingleton(as: IPlansDS)
class PlansDSImpl implements IPlansDS {
  const PlansDSImpl();
}
