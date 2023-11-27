import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

showLoadingDialog() => Get.defaultDialog(
      title: "",
      backgroundColor: Colors.white,
      content: Center(
        child: CircularProgressIndicator(
          color: Colors.grey.shade300,
          strokeWidth: 1,
        ),
      ),
    );
