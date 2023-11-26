import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbar({String? title, String? subTitle}) => Get.snackbar(
      title!,
      subTitle!,
      backgroundColor: const Color(0xff4dae50),
      colorText: Colors.white,
    );
