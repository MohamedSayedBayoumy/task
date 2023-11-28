import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';
import '../constants/text_field_style.dart';
import '../functions/media_query.dart';

class CustomTextPhoneField extends StatelessWidget {
  final TextEditingController? phoneController,
      codeCountryController,
      codeCountryNumberController;
  final void Function(PhoneNumber)? onChanged;
  const CustomTextPhoneField({
    super.key,
    required this.phoneController,
    this.codeCountryController,
    this.codeCountryNumberController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Media.height(context, space: .015)),
      child: IntlPhoneField(
        controller: phoneController,
        onCountryChanged: (value) {
          codeCountryController!.text = value.code;
          codeCountryNumberController!.text = value.dialCode;
        },
        initialCountryCode: codeCountryController?.text,
        onChanged: onChanged,
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
        style: Fonts.mainStyleBold,
      ),
    );
  }
}
