import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task/common/constants/colors.dart';
import 'package:task/common/constants/fonts/fonts.dart';
import 'package:task/controllers/register_controller.dart';

import '../../common/constants/text_field_style.dart';
import '../../common/functions/media_query.dart';
import '../../common/functions/validation/vailda.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Media.height(context, space: .015)),
                child: IntlPhoneField(
                  controller: controller.phoneController,
                  textInputAction: TextInputAction.next,
                  dropdownIcon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.mainColor,
                  ),
                  validator: (phone) {
                    if (phone!.number.isEmpty) {
                      return "Invalid mobile number";
                    }
                    return "Invalid mobile number";
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "55994435",
                    focusedErrorBorder: TextFieldBorderStyle.enabledBorder
                        .copyWith(
                            borderSide: BorderSide(color: Colors.red.shade700)),
                    enabledBorder: TextFieldBorderStyle.enabledBorder,
                    errorBorder: TextFieldBorderStyle.enabledBorder.copyWith(
                        borderSide: BorderSide(color: Colors.red.shade700)),
                    focusedBorder: TextFieldBorderStyle.focusedBorder,
                  ),
                  initialCountryCode: 'AE',
                  style: Fonts.mainStyleBold,
                  onCountryChanged: (value) {
                    controller.countryCodeController!.text =
                        "+${value.dialCode.toString()}";
                  },
                ),
              ),
              CustomTextField(
                controller: controller.emailController,
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
                  controller.showPassowrd("password");
                },
              ),
              CustomTextField(
                controller: controller.confirmPasswordController,
                hinText: "Confirm Password",
                enableSuffixIcon: true,
                valid: (value) {
                  return Validation.isEmpty(value!);
                },
                obscureText: controller.showConfirmPassword,
                onPressedSuffixIcon: () {
                  controller.showPassowrd("confirmPassword");
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
