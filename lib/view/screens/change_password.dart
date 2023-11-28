import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/functions/media_query.dart';
import '../../common/functions/validation/vailda.dart';
import '../../common/widgets/custom_appbar.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../controllers/change_password.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Change Password",
        height: Media.height(context, space: .09),
        enableBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Media.width(context, space: .17),
          vertical: 30,
        ),
        child: GetBuilder<ChangePasswordController>(
          builder: (controller) => Form(
            key: controller.formstate,
            child: Column(
              children: [
                CustomTextField(
                  controller: controller.currentPasswordController,
                  hinText: "Current Password",
                  valid: (value) {
                    return Validation.isEmpty(value!);
                  },
                ),
                CustomTextField(
                  controller: controller.newPasswordController,
                  hinText: "New Password",
                  valid: (value) {
                    return Validation.isEmpty(value.toString());
                  },
                ),
                CustomTextField(
                  controller: controller.confirmNewPasswordController,
                  hinText: "Confirm New Password",
                  valid: (value) {
                    return Validation.isEmpty(value.toString());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.changePassword();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
