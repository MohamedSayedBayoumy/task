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

  static TextStyle titleSnakBarStyle = const TextStyle(
    fontFamily: AppFontFamily.fontBold,
    color: Colors.white,
    fontSize: 20,
  );
  
  static TextStyle subTitleSnakBarStyle = const TextStyle(
    fontFamily: AppFontFamily.fontRegular,
    color: Colors.white,
    fontSize: 15,
  );
}
