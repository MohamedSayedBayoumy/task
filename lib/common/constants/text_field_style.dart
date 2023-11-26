import 'package:flutter/material.dart';
import 'package:task/common/constants/colors.dart';

abstract class TextFieldBorderStyle {
  static final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.mainColor),
  );

  static final enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: AppColors.borderColor,
    ),
  );
}
