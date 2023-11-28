import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';
import '../functions/media_query.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? textColor, borderColor, backgroundColor;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    this.textColor,
    this.backgroundColor,
    required this.text,
    this.width,
    required this.onPressed,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Media.width(context),
      height: Media.height(context, space: .055),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.mainColor),
            borderRadius:
                BorderRadius.circular(8), // Set your desired border radius
          ),
          backgroundColor: backgroundColor ?? AppColors.mainColor,
        ),
        child: Text(
          text,
          style: Fonts.mainStyleBold.copyWith(
            color: textColor ?? Colors.white,
            fontSize: Media.width(context, space: .05),
          ),
        ),
      ),
    );
  }
}
