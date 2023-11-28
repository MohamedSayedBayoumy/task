import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/functions/media_query.dart';
import '../../common/functions/validation/vailda.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../controllers/login_controller.dart';

class LoginTextFieldsWidget extends StatelessWidget {
  const LoginTextFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Media.height(context, space: .16),
        left: Media.width(context, space: .17),
        right: Media.width(context, space: .17),
      ),
      child: GetBuilder<LoginController>(
        builder: (controller) => Form(
          key: controller.formstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: controller.emailController,
                hinText: "Email Address",
                keyboardType: TextInputType.emailAddress,
                valid: (value) {
                  return Validation.emailFormat(value.toString());
                },
              ),
              CustomTextField(
                controller: controller.passwordController,
                hinText: "Password",
                enableSuffixIcon: true,
                obscureText: controller.showPassword,
                onPressedSuffixIcon: () {
                  controller.showPassowrd();
                },
                valid: (value) {
                  return Validation.isEmpty(value!);
                },
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: Media.height(context, space: .03)),
                child: CustomButton(
                  text: "Login",
                  onPressed: () {
                    controller.login();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
