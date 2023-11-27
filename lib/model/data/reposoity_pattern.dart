import 'package:dio/dio.dart';
import 'package:task/common/services/dio/dio_services.dart';
import 'package:task/common/services/dio/end_piontes.dart';
import 'package:task/model/models/register_models/register_model.dart';
import 'package:task/model/models/register_models/register_prameter_model.dart';

import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';

abstract class AuthenticationUser {
  Future<Either<FailureHandler, RegisterModel>> register(
      {RegisterParameterModel? registerParameterModel});
}

class AuthenticationUserimplemention implements AuthenticationUser {
  @override
  Future<Either<FailureHandler, RegisterModel>> register(
      {RegisterParameterModel? registerParameterModel}) async {
    try {
      final response = await DioServices.post(
        url: ApiEndpoints.regsiterEndpoints,
        body: registerParameterModel!.toJson(),
      );

      return Right(RegisterModel.fromJson(response.data));
    } on DioExceptionType catch (e) {
      return left(
        DioFailure.fromDioException(e),
      );
    }
  }
}
