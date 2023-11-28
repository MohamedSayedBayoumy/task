import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/functions/alert_loading.dart';
import '../common/functions/snackbar.dart';
import '../common/routes/pages.dart';
import '../model/data/reposoity_pattern.dart';
import '../model/models/change_password_prameter_model.dart';

class ChangePasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final AuthenticationUser authenticationUser;

  ChangePasswordController(this.authenticationUser);

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  Future changePassword() async {
    if (formstate.currentState!.validate()) {
      showLoadingDialog();

      final result = await authenticationUser.changePassword(
        changePasswordParameterModel: ChangePasswordParameterModel(
          currentPassword: currentPasswordController.text,
          newPassword: newPasswordController.text,
          confirmPassword: confirmNewPasswordController.text,
        ),
      );
      result.fold((l) {
        Get.back();

        showCustomSnackbar(
          title: "Failed",
          subTitle: l.listOfFailures!
              .map((errorMap) => "• ${errorMap["password"]}")
              .join('\n'),
          durationSeconds: 5,
          success: false,
        );
        update();
      }, (r) {
        Future.delayed(const Duration(milliseconds: 500), () {
          showCustomSnackbar(
            title: "Success",
            subTitle: "Your information is updated successfully",
            success: true,
          );
          Get.offAllNamed(AppRoute.home);
        });

        update();
      });
    }
  }

  @override
  void onClose() {
    confirmNewPasswordController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }
}
