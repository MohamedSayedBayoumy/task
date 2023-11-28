import 'package:dio/dio.dart';

class RegisterParameterModel {
 final String name;
 final String email;
 final String phone;
 final String password;
 final String? countryCode;
 final String passwordConfirm;

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
      'country_code': countryCode?.toString() ?? "+971",
      'password_confirm': passwordConfirm,
    });
  }

 
}
