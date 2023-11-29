import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';
import '../constants/text_field_style.dart';
import '../functions/media_query.dart';
 

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hinText;
  final bool? obscureText;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onPressedSuffixIcon;
  final bool? enableSuffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText,
    this.textInputAction,
    this.onPressedSuffixIcon,
    this.keyboardType,
    this.hinText,
    this.valid,
    this.enableSuffixIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Media.height(context, space: .015)),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style: Fonts.mainStyleBold
            .copyWith(fontSize: Media.width(context, space: .041)),
        obscureText: obscureText == false ? true : false,
        textInputAction: textInputAction ?? TextInputAction.next,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        validator: valid,
        controller: controller,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        decoration: InputDecoration(
          suffixIcon: enableSuffixIcon == true
              ? IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(
                    obscureText == false
                        ? Icons.visibility
                        : Icons.visibility_off_sharp,
                    color: obscureText == false
                        ? AppColors.secondColor
                        : AppColors.mainColor,
                  ),
                )
              : null,
          errorStyle:
              Fonts.mainStyleBold.copyWith(color: AppColors.failureColor),
          hintText: hinText,
          hintStyle: Fonts.mainStyleBold.copyWith(
            color: AppColors.secondColor,
          ),
          focusedBorder: TextFieldBorderStyle.focusedBorder,
          enabledBorder: TextFieldBorderStyle.enabledBorder,
          focusedErrorBorder: TextFieldBorderStyle.enabledBorder
              .copyWith(borderSide: BorderSide(color: Colors.red.shade700)),
          errorBorder: TextFieldBorderStyle.enabledBorder
              .copyWith(borderSide: BorderSide(color: Colors.red.shade700)),
        ),
      ),
    );
  }
}
