import 'package:dio/dio.dart';

abstract class FailureHandler {
  final String failureMessag;
  final List<dynamic>? listOfFailures;
  final DioException modelExpation;

  FailureHandler({
    this.listOfFailures = const [],
    required this.modelExpation,
    required this.failureMessag,
  });
}

class DioFailure extends FailureHandler {
  DioFailure(
      {required super.failureMessag,
      required super.modelExpation,
      super.listOfFailures});

  factory DioFailure.fromDioException(
      {DioExceptionType? dioType, DioException? exception}) {
    switch (dioType!) {
      case DioExceptionType.connectionTimeout:
        return DioFailure(
          failureMessag: "Check your internet connection , try again",
          modelExpation: exception!,
        );
      case DioExceptionType.sendTimeout:
        return DioFailure(
            failureMessag: "please try again", modelExpation: exception!);
      case DioExceptionType.receiveTimeout:
        return DioFailure(
          failureMessag: "please try again",
          modelExpation: exception!,
        );
      case DioExceptionType.badCertificate:
        return DioFailure(
          failureMessag: "please try again later",
          modelExpation: exception!,
        );
      case DioExceptionType.badResponse:
        return DioFailure(
          failureMessag: exception!.response!.data["message"].toString(),
          listOfFailures: exception.response!.data["data"],
          modelExpation: exception,
        );
      case DioExceptionType.cancel:
        return DioFailure(
          failureMessag: "Request Canceled",
          modelExpation: exception!,
        );
      case DioExceptionType.connectionError:
        return DioFailure(
          failureMessag: "Check your internet connection",
          modelExpation: exception!,
        );
      case DioExceptionType.unknown:
        return DioFailure(
          failureMessag: "Some Things went wrong , try again",
          modelExpation: exception!,
        );
    }
  }
}
