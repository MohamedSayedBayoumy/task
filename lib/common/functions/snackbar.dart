import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';

showCustomSnackbar({
  String? title,
  String subTitle = "",
  int? durationSeconds,
  bool success = true,
}) =>
    Get.snackbar(
      title!,
      subTitle,
      titleText: Text(
        title,
        style: Fonts.titleSnakBarStyle,
      ),
      messageText: Text(
        subTitle,
        style: Fonts.subTitleSnakBarStyle,
      ),
      duration: Duration(seconds: durationSeconds ?? 3),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: success ? AppColors.sucessColor : AppColors.failureColor,
    );
