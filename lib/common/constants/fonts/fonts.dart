import 'package:flutter/material.dart';

import '../colors.dart';
import 'font_family.dart';

abstract class Fonts {
  static TextStyle mainStyleRegular = TextStyle(
    color: AppColors.mainColor,
    fontFamily: AppFontFamily.fontRegular,
  );

  static TextStyle mainStyleBold = TextStyle(
    color: AppColors.mainColor,
    fontFamily: AppFontFamily.fontBold,
  );
}
