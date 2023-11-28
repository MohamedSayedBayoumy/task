import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/functions/alert_loading.dart';
import '../common/functions/snackbar.dart';
import '../common/routes/pages.dart';
import '../common/services/setting_services.dart';
import '../model/data/reposoity_pattern.dart';
import '../model/models/register_prameter_model.dart';
import '../model/models/set_user_parameter_model.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController? countryCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthenticationUser authenticationUser;

  bool showPassword = false;
  bool showConfirmPassword = false;

  RegisterController(this.authenticationUser);

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
          countryCode: countryCodeController?.text.toString() ?? "+971",
          passwordConfirm: confirmPasswordController.text,
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
          Get.offAllNamed(AppRoute.home);
        });
        update();
      });
    }
  }

  @override
  void onInit() {
    phoneController.clear();
    countryCodeController!.text = "+971";
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryCodeController!.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
