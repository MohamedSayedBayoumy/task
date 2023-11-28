import 'package:dio/dio.dart';

class ChangePasswordParameterModel {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordParameterModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  FormData toFormData() {
    return FormData.fromMap({
      'current_password': currentPassword,
      'password': newPassword,
      "password_confirm": confirmPassword,
    });
  }
}
