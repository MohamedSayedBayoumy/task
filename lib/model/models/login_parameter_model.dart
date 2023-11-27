import 'package:dio/dio.dart';

class LoginParameterModel {
  final String email;
  final String password;

  LoginParameterModel({required this.email, required this.password});

  FormData toFormData() {
    return FormData.fromMap({
      'email': email,
      'password': password,
    });
  }
}
