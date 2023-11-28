import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/functions/alert_loading.dart';
import '../common/functions/snackbar.dart';
import '../common/routes/pages.dart';
import '../model/data/reposoity_pattern.dart';
import '../model/models/user_model.dart';

class UpDateInformationController extends GetxController {
  UserModel user = Get.arguments;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final AuthenticationUser authenticationUser;

  UpDateInformationController(this.authenticationUser);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController countryCodeController = TextEditingController();

  final TextEditingController countryCodeNumberController =
      TextEditingController();

  Future updateUser() async {
    if (formstate.currentState!.validate()) {
      showLoadingDialog();

      final result = await authenticationUser.updateUser(
        data: UserData(
          email: emailController.text,
          name: nameController.text,
          phone: "${countryCodeNumberController.text} ${phoneController.text}",
          countryCode: countryCodeController.text,
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
  void onInit() {
    nameController.text = user.data!.name!;
    emailController.text = user.data!.email!;
    countryCodeController.text = user.data!.countryCode!;
    phoneController.text = user.data!.phone!.split(" ")[1].trim();
    countryCodeNumberController.text = user.data!.phone!.split(" ")[0].trim();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();

    super.onClose();
  }
}
