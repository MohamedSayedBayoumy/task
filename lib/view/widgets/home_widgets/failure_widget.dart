import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';
import '../../../common/constants/fonts/fonts.dart';
import '../../../common/functions/media_query.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../controllers/home_controller.dart';

class FaliureHomeScreenWidget extends StatelessWidget {
  final HomeController controller;

  const FaliureHomeScreenWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Media.height(context),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.failureMessage,
              style: Fonts.mainStyleBold.copyWith(
                  color: AppColors.failureColor,
                  fontSize: Media.width(context, space: .05)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: CustomButton(
                width: Media.width(context, space: .3),
                text: "Reload",
                backgroundColor: AppColors.failureColor,
                borderColor: AppColors.failureColor,
                textColor: Colors.white,
                onPressed: () {
                  controller.getUser();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
