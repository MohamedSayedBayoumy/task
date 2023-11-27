import 'package:dio/dio.dart';
import 'package:task/common/services/dio/dio_services.dart';
import 'package:task/common/services/dio/end_piontes.dart';
import 'package:task/model/models/login_parameter_model.dart';
import 'package:task/model/models/register_prameter_model.dart';

import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';
import '../models/user_model.dart';

abstract class AuthenticationUser {
  Future<Either<FailureHandler, UserModel>> register(
      {RegisterParameterModel? registerParameterModel});

  Future<Either<FailureHandler, UserModel>> login(
      {LoginParameterModel? loginParameterModel});
}

class AuthenticationUserimplemention implements AuthenticationUser {
  @override
  Future<Either<FailureHandler, UserModel>> register(
      {RegisterParameterModel? registerParameterModel}) async {
    try {
      final response = await DioServices.post(
        url: ApiEndpoints.regsiterEndpoint,
        body: registerParameterModel!.toFormData(),
      );

      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(
        DioFailure.fromDioException(dioType: e.type, exception: e),
      );
    }
  }

  @override
  Future<Either<FailureHandler, UserModel>> login(
      {LoginParameterModel? loginParameterModel}) async {
    try {
      final response = await DioServices.post(
        url: ApiEndpoints.loginEndpoint,
        body: loginParameterModel!.toFormData(),
      );

      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(
        DioFailure.fromDioException(dioType: e.type, exception: e),
      );
    }
  }
}
