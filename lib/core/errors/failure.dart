import 'package:equatable/equatable.dart';
import 'package:exercises/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({
    required this.message,
    required this.statusCode,
  });

  String get errorMessage => '$statusCode Error : $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class APIFailure extends Failure {

  const APIFailure({required super.message,required super.statusCode});

  APIFailure.fromException(APIException exception)
      : this(message: exception.message, statusCode: exception.statusCode);

}

class ServerFailure extends Failure {
  const ServerFailure({
    required String message,
    required int statusCode,
  }) : super(message: message, statusCode: statusCode);
}

class LocalFailure extends Failure {
  const LocalFailure({
    required String message,
    required int statusCode,
  }) : super(message: message, statusCode: statusCode);
}