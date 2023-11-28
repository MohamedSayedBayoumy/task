import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/functions/alert_loading.dart';
import 'package:task/common/functions/snackbar.dart';
import 'package:task/common/routes/pages.dart';
import 'package:task/common/services/setting_services.dart';
import 'package:task/model/models/login_parameter_model.dart';
import 'package:task/model/models/set_user_parameter_model.dart';

import '../model/data/reposoity_pattern.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthenticationUser authenticationUser;

  bool showPassword = false;

  LoginController(this.authenticationUser);

  showPassowrd() {
    showPassword = !showPassword;
    update();
  }

  Future login() async {
    if (formstate.currentState!.validate()) {
      showLoadingDialog();

      final result = await authenticationUser.login(
        loginParameterModel: LoginParameterModel(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
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
        Services.setUser(
          setUserParameterModel: SetUserParameterModel(
            token: r.data!.token.toString(),
            id: r.data!.id.toString(),
          ),
        ).then((value) {
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
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
