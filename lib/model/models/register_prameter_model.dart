import 'package:dio/dio.dart';

class RegisterParameterModel {
  String name;
  String email;
  String phone;
  String password;
  String countryCode;
  String passwordConfirm;

  RegisterParameterModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.countryCode,
    required this.passwordConfirm,
  });

  FormData toFormData() {
    return FormData.fromMap({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'country_code': countryCode,
      'password_confirm': passwordConfirm,
    });
  }

 
}
