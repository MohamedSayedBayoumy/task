import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';
import '../constants/text_field_style.dart';
import '../functions/media_query.dart';

class CustomTextPhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController codeController;
  const CustomTextPhoneField({
    super.key,
    required this.phoneController,
    required this.codeController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Media.height(context, space: .015)),
      child: IntlPhoneField(
        controller: phoneController,
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
              .copyWith(borderSide: BorderSide(color: Colors.red.shade700)),
          enabledBorder: TextFieldBorderStyle.enabledBorder,
          errorBorder: TextFieldBorderStyle.enabledBorder
              .copyWith(borderSide: BorderSide(color: Colors.red.shade700)),
          focusedBorder: TextFieldBorderStyle.focusedBorder,
        ),
        initialCountryCode: 'AE',
        style: Fonts.mainStyleBold,
        onCountryChanged: (value) {
          codeController.text = "+${value.dialCode.toString()}";
        },
      ),
    );
  }
}
