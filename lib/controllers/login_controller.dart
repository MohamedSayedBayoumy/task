import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/models/register_models/register_prameter_model.dart';

import '../model/data/reposoity_pattern.dart';

class LoginController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  AuthenticationUser authenticationUser = AuthenticationUserimplemention();

  Future register(
      {required RegisterParameterModel registerParameterModel}) async {
    
    showalterloading 
    
    final result = await authenticationUser.register(
      registerParameterModel: registerParameterModel,
    );

    result.fold((l) {}, (r) {});
  }
}
