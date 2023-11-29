import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/functions/media_query.dart';
import '../../common/widgets/custom_button.dart';
import '../../controllers/register_controller.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/functions/validation/vailda.dart';
import '../../common/widgets/custom_text_phone_field.dart';

class RegsiterTextFieldsWidget extends StatelessWidget {
  const RegsiterTextFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Media.height(context, space: .05),
        left: Media.width(context, space: .17),
        right: Media.width(context, space: .17),
      ),
      child: GetBuilder<RegisterController>(builder: (controller) {
        return Form(
          key: controller.formstate,
          child: Column(
            children: [
              CustomTextField(
                controller: controller.nameController,
                valid: (value) {
                  return Validation.isEmpty(value!);
                },
                hinText: "Full Name",
              ),
              CustomTextPhoneField(
                codeCountryController: controller.countryCodeController!,
                codeCountryNumberController:
                    controller.countryNumberCodeController!,
                phoneController: controller.phoneController,
               focusNode: FocusNode(),
              ),
              CustomTextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                hinText: "Email Address",
                valid: (value) {
                  return Validation.emailFormat(value.toString());
                },
              ),
              CustomTextField(
                controller: controller.passwordController,
                hinText: "Password",
                valid: (value) {
                  return Validation.isEmpty(value!);
                },
                enableSuffixIcon: true,
                obscureText: controller.showPassword,
                onPressedSuffixIcon: () {
                  controller.showPassowrd(to: controller.passwordController);
                },
              ),
              CustomTextField(
                controller: controller.confirmPasswordController,
                hinText: "Confirm Password",
                enableSuffixIcon: true,
                valid: (value) {
                  return Validation.checkConformation(
                    value: value!,
                    compareWith: controller.passwordController.text,
                  );
                },
                obscureText: controller.showConfirmPassword,
                onPressedSuffixIcon: () {
                  controller.showPassowrd(
                      to: controller.confirmPasswordController);
                },
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: Media.height(context, space: .05)),
                child: CustomButton(
                  text: "Register",
                  onPressed: () {
                    controller.register();
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
