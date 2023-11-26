import 'package:flutter/material.dart';
import 'package:task/common/constants/colors.dart';
import 'package:task/common/constants/fonts/fonts.dart';

class CustomButton extends StatelessWidget {
  final Size media;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.media,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: media.width,
      height: media.height * .055,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.mainColor),
            borderRadius:
                BorderRadius.circular(8), // Set your desired border radius
          ),
          backgroundColor: backgroundColor ?? AppColors.mainColor,
        ),
        child: Text(text,
            style: Fonts.mainStyleBold.copyWith(
              color: textColor ?? Colors.white,
              fontSize: media.width * .05,
            )),
      ),
    );
  }
}
