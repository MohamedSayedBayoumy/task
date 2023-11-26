import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../common/constants/text_field_style.dart';
import '../../common/functions/media_query.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: TextEditingController(),
            hinText: "Email Address",
          ),
          CustomTextField(
            controller: TextEditingController(),
            hinText: "Password",
            enableSuffixIcon: true,
          ),
          Padding(
            padding: EdgeInsets.only(top: Media.height(context, space: .03)),
            child: CustomButton(
              text: "Login",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
