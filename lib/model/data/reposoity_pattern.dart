import 'package:dio/dio.dart';

import 'package:dartz/dartz.dart';

import '../../common/errors/failures.dart';
import '../../common/services/dio/dio_services.dart';
import '../../common/services/dio/end_piontes.dart';
import '../../common/services/setting_services.dart';
import '../models/change_password_prameter_model.dart';
import '../models/login_parameter_model.dart';
import '../models/register_prameter_model.dart';
import '../models/set_user_parameter_model.dart';
import '../models/user_model.dart';
import '../models/users_model.dart';

abstract class AuthenticationUser {
  Future<Either<FailureHandler, UserModel>> register(
      {RegisterParameterModel? registerParameterModel});

  Future<Either<FailureHandler, UserModel>> login(
      {LoginParameterModel? loginParameterModel});

  Future<Either<FailureHandler, UserModel>> getUser({String? token});

  Future<Either<FailureHandler, UserModel>> updateUser(
      {required UserData data});

  Future<Either<FailureHandler, UpdateUserModel>> changePassword({
    required ChangePasswordParameterModel changePasswordParameterModel,
  });

  Future<Either<FailureHandler, UpdateUserModel>> deleteAccount({
    String token,
  });
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

  @override
  Future<Either<FailureHandler, UserModel>> getUser({String? token}) async {
    final user = Services.getUser();
    try {
      final response = await DioServices.get(
        url: "${ApiEndpoints.getUserEndpoint}/${user.id}",
        token: user.token,
      );

      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(
        DioFailure.fromDioException(dioType: e.type, exception: e),
      );
    }
  }

  @override
  Future<Either<FailureHandler, UserModel>> updateUser({UserData? data}) async {
    try {
      final response = await DioServices.post(
        url: ApiEndpoints.updateEndpoint,
        body: data!.toFormData(),
        token: Services.getUser().token,
      );

      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(
        DioFailure.fromDioException(dioType: e.type, exception: e),
      );
    }
  }

  @override
  Future<Either<FailureHandler, UpdateUserModel>> changePassword(
      {required ChangePasswordParameterModel
          changePasswordParameterModel}) async {
    try {
      final response = await DioServices.post(
        url: ApiEndpoints.changePasswordEndpoint,
        body: changePasswordParameterModel.toFormData(),
        token: Services.getUser().token,
      );

      return Right(UpdateUserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(
        DioFailure.fromDioException(dioType: e.type, exception: e),
      );
    }
  }

  @override
  Future<Either<FailureHandler, UpdateUserModel>> deleteAccount(
      {String? token}) async {
    try {
      final response = await DioServices.delete(
        url: ApiEndpoints.deleteEndpoint,
        token: Services.getUser().token,
      );

      Services.setUser(
          setUserParameterModel: SetUserParameterModel(token: "", id: ""));

      return Right(UpdateUserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(
        DioFailure.fromDioException(dioType: e.type, exception: e),
      );
    }
  }
}
