import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/fonts/fonts.dart';
import '../../common/constants/images.dart';
import '../../common/routes/pages.dart';
import '../../common/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: media.height * .08, bottom: 15),
                child: Image.asset(
                  Images.logo,
                  height: media.height * .15,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "Welcome to the app",
                  style: Fonts.mainStyleBold.copyWith(
                    fontSize: media.width * .07,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: media.height * .3,
                  left: media.width * .18,
                  right: media.width * .18,
                  bottom: 10,
                ),
                child: CustomButton(
                  media: media,
                  text: "Login",
                  onPressed: () {
                    Get.toNamed(AppRoute.login);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * .18),
                child: CustomButton(
                  media: media,
                  text: "Register",
                  backgroundColor: Colors.white,
                  textColor: AppColors.mainColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.register);
                  },
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: RichText(
                    text: TextSpan(
                      text: 'Designed & Developmed by ',
                      style: Fonts.mainStyleRegular,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Ali Fouad',
                            style: Fonts.mainStyleBold.copyWith(
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
