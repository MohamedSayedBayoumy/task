import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/functions/alert_loading.dart';
import '../common/functions/snackbar.dart';
import '../common/routes/pages.dart';
import '../common/services/setting_services.dart';
import '../model/data/reposoity_pattern.dart';
import '../model/models/login_parameter_model.dart';
import '../model/models/set_user_parameter_model.dart';

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
        Get.back();
        showCustomSnackbar(
          title: "Failed",
          subTitle: l.failureMessag,
          success: false,
        );

        update();
      }, (r) {
        Get.back();
        showCustomSnackbar(
          title: "Success",
          subTitle: r.message!,
          success: true,
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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
