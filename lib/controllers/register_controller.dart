
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/functions/alert_loading.dart';
import 'package:task/common/functions/snackbar.dart';
import 'package:task/common/routes/pages.dart';
import 'package:task/common/services/setting_services.dart';
import 'package:task/model/models/register_models/register_prameter_model.dart';

import '../model/data/reposoity_pattern.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthenticationUser authenticationUser =
      AuthenticationUserimplemention();

  bool showPassword = false;
  bool showConfirmPassword = false;

  showPassowrd(String to) {
    if (to == "password") {
      showPassword = !showPassword;
    } else {
      showConfirmPassword = !showConfirmPassword;
    }
    update();
  }

  Future register() async {
    if (formstate.currentState!.validate()) {
      showLoadingDialog();

      final result = await authenticationUser.register(
        registerParameterModel: RegisterParameterModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          countryCode: countryCodeController.text,
          passwordConfirm: confirmPasswordController.text,
        ),
      );

      result.fold((l) {
        snackbar(
          title: "Failed",
          subTitle: l.failureMessag,
          isSuccess: false,
        );
        update();
      }, (r) {
        snackbar(
          title: "Success",
          subTitle: r.message!,
          isSuccess: true,
        );
        Services.setUserData(r.toJson()).then((value) {
          Future.delayed(const Duration(seconds: 1), () {
            Get.offAllNamed(AppRoute.home);
          });
        });
        update();
      });
    }
  }

  snackbar({String? title, String? subTitle, bool? isSuccess}) {
    Get.back();
    showCustomSnackbar(
      title: title,
      subTitle: subTitle!,
      success: isSuccess!,
    );
  }

  @override
  void onInit() {
    phoneController.clear();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
