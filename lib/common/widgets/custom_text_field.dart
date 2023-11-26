import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/common/constants/colors.dart';
import 'package:task/common/constants/fonts/fonts.dart';
import 'package:task/common/constants/text_field_style.dart';
import 'package:task/common/functions/media_query.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hinText;
  final bool? obscureText;
  final String? Function(String?)? valid;
  final String? Function(String?)? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onPressedSuffixIcon;
  final bool? enableSuffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.inputFormatters,
    this.obscureText,
    this.textInputAction,
    this.onPressedSuffixIcon,
    this.keyboardType,
    this.onChange,
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
        style: Fonts.mainStyleRegular
            .copyWith(fontSize: Media.width(context, space: .04)),
        obscureText: obscureText == false ? true : false,
        textInputAction: textInputAction ?? TextInputAction.next,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        onChanged: onChange,
        validator: valid,
        controller: controller,
        inputFormatters: inputFormatters,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        decoration: InputDecoration(
          suffixIcon: enableSuffixIcon == true
              ? IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(
                    obscureText == true
                        ? Icons.visibility
                        : Icons.visibility_off_sharp,
                    color: obscureText == true
                        ? AppColors.secondColor
                        : AppColors.mainColor,
                  ),
                )
              : null,
          hintText: hinText,
          hintStyle: Fonts.mainStyleBold.copyWith(
            color: AppColors.secondColor,
          ),
          focusedBorder: TextFieldBorderStyle.focusedBorder,
          enabledBorder: TextFieldBorderStyle.enabledBorder,
        ),
      ),
    );
  }
}
