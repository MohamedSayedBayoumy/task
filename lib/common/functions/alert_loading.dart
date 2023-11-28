import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/fonts/fonts.dart';

showLoadingDialog() => Get.defaultDialog(
      title: "Loading .. .",
      titleStyle: Fonts.mainStyleBold,
      backgroundColor: Colors.white,
      content: Center(
        child: CircularProgressIndicator(
          color: Colors.grey.shade300,
          strokeWidth: 1,
        ),
      ),
    );

// showAlertConfirmDeleteAccout({void Function()? onConfirm}) => Get.defaultDialog(
//       title: "Account",
//       titlePadding: const EdgeInsets.all(30),
//       titleStyle: Fonts.mainStyleBold,
//       backgroundColor: Colors.white,
//       onConfirm: onConfirm,
//       confirm: Container(
//         padding: const EdgeInsets.all(15),
//         color: AppColors.failureColor,
//         child: const Text("Confirm"),
//       ),
//       onCancel: () {
//         Get.back();
//       },
//       cancel: Container(
//         padding: const EdgeInsets.all(15),
//         color: Colors.grey.shade400,
//         child: const Text("Cancel"),
//       ),
//       content: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           'Confirm to Delete Account',
//           style: Fonts.mainStyleBold.copyWith(color: AppColors.failureColor),
//         ),
//       ),
//     );
