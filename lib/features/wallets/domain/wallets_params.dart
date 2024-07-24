
import '../../../core/logical/abstract/models.dart';

class WalletsParams {
  WalletsParams({this.generalParams});

  final GeneralParams? generalParams;

  void reset(){
    generalParams?.reset();
  }

  Map<String, dynamic> toJson() => {
        if (generalParams != null) ...generalParams!.toJson(),
      };
}