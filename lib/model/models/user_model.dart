import 'package:dio/dio.dart';

class UserModel {
  bool? success;
  String? message;
  UserData? data;

  UserModel({
    this.success,
    this.message,
    this.data,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? name;
  String? countryCode;
  String? phone;
  String? email;
  String? token;
  String? tokenExpiry;

  UserData(
      {this.id,
      this.name,
      this.countryCode,
      this.phone,
      this.email,
      this.token,
      this.tokenExpiry});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'] ?? "";
    tokenExpiry = json['token_expiry'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token ?? "";
    data['token_expiry'] = tokenExpiry ?? "";
    return data;
  }

  FormData toFormData() {
    FormData formData = FormData.fromMap({
      'id': id ?? '',
      'name': name ?? '',
      'country_code': countryCode ?? '',
      'phone': phone ?? '',
      'email': email ?? '',
      'token': token ?? '',
      'tokenExpiry': tokenExpiry ?? '',
    });

    return formData;
  }
}
