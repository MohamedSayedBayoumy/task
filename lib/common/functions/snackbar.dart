import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/constants/colors.dart';
import 'package:task/common/constants/fonts/fonts.dart';

showCustomSnackbar({
  String? title,
  String subTitle = "",
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: success ? AppColors.sucessColor : AppColors.failureColor,
    );
