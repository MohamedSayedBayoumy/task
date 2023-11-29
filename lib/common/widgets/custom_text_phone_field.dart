import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';
import '../constants/text_field_style.dart';
import '../functions/media_query.dart';

class CustomTextPhoneField extends StatelessWidget {
  final TextEditingController? phoneController,
      codeCountryController,
      codeCountryNumberController;
  final FocusNode? focusNode;
  const CustomTextPhoneField({
    super.key,
    required this.phoneController,
    this.codeCountryController,
    this.codeCountryNumberController,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Media.height(context, space: .015)),
      child: IntlPhoneField(
        focusNode: focusNode!,
        controller: phoneController,
        onCountryChanged: (value) {
          focusNode!.requestFocus();
          phoneController!.text = "";
          codeCountryController!.text = value.code.toString();
          codeCountryNumberController!.text = "+${value.dialCode.toString()}";
        },
        initialCountryCode: codeCountryController?.text,
        textInputAction: TextInputAction.next,
        dropdownIcon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.mainColor,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
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
