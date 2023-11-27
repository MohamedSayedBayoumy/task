import 'package:dio/dio.dart';

abstract class FailureHandler {
  final String failureMessag;

  FailureHandler({required this.failureMessag});
}

class DioFailure extends FailureHandler {
  DioFailure({required super.failureMessag});

  factory DioFailure.fromDioException(DioExceptionType dioType) {
    switch (dioType) {
      case DioExceptionType.connectionTimeout:
        return DioFailure(
            failureMessag: "Check your internet connection , try again");
      case DioExceptionType.sendTimeout:
        return DioFailure(failureMessag: "please try again");
      case DioExceptionType.receiveTimeout:
        return DioFailure(failureMessag: "please try again");
      case DioExceptionType.badCertificate:
        return DioFailure(failureMessag: "please try again later");
      case DioExceptionType.badResponse:
        return DioFailure(
            failureMessag:
                "We have New technical modifications, please try again later");
      case DioExceptionType.cancel:
        return DioFailure(failureMessag: "Request Canceled");
      case DioExceptionType.connectionError:
        return DioFailure(failureMessag: "Check your internet connection");
      case DioExceptionType.unknown:
        return DioFailure(failureMessag: "Some Things went wrong , try again");
    }
  }
}
