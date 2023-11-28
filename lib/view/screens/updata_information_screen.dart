import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/functions/media_query.dart';
import '../../common/functions/validation/vailda.dart';
import '../../common/widgets/custom_appbar.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/custom_text_phone_field.dart';
import '../../controllers/update_controller.dart';

class UpDateInformationScreen extends StatelessWidget {
  const UpDateInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Update information",
        height: Media.height(context, space: .09),
        enableBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Media.width(context, space: .17),
          vertical: 30,
        ),
        child: GetBuilder<UpDateInformationController>(
          builder: (controller) => Form(
            key: controller.formstate,
            child: Column(
              children: [
                CustomTextField(
                  controller: controller.nameController,
                  hinText: "Name",
                  valid: (value) {
                    return Validation.isEmpty(value!);
                  },
                ),
                CustomTextPhoneField(
                  codeController: controller.countryCodeController,
                  phoneController: controller.phoneController,
                 
                ),
                CustomTextField(
                  controller: controller.emailController,
                  hinText: "Email Address",
                  valid: (value) {
                    return Validation.emailFormat(value.toString());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.updateUser();
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
