import 'error_model.dart';

class Failure {}

class ServerFailure extends Failure {}

class InternetFailure extends Failure {}

class HttpFailure extends Failure {
  final String message;
  final Map<String, dynamic>? data;
  final ErrorModel? errorModel;
  HttpFailure(
    this.message, {
    this.errorModel,
    this.data,
  });
}
