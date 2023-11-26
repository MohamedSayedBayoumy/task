import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../common/constants/text_field_style.dart';
import '../../common/functions/media_query.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';

class TextFieldsWidget extends StatelessWidget {
  const TextFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Media.height(context, space: .05),
        left: Media.width(context, space: .17),
        right: Media.width(context, space: .17),
      ),
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            hinText: "Full Name",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Media.height(context, space: .015)),
            child: IntlPhoneField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                counterText: "",
                hintText: "55994435",
                enabledBorder: TextFieldBorderStyle.enabledBorder,
                focusedBorder: TextFieldBorderStyle.focusedBorder,
              ),
              initialCountryCode: 'AE',
              onCountryChanged: (s) {},
              onChanged: (phone) {},
            ),
          ),
          CustomTextField(
            controller: TextEditingController(),
            hinText: "Email Address",
          ),
          CustomTextField(
            controller: TextEditingController(),
            hinText: "Password",
            enableSuffixIcon: true,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hinText: "Confirm Password",
            enableSuffixIcon: true,
          ),
          Padding(
            padding: EdgeInsets.only(top: Media.height(context, space: .05)),
            child: CustomButton(
              text: "Register",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
