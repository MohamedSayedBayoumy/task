import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/colors.dart';
import '../../common/functions/media_query.dart';
import '../../common/routes/pages.dart';
import '../../common/widgets/custom_button.dart';
import '../widgets/logo_widget.dart';
import '../widgets/rich_text_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: LogoWidget(
                titleScreen: "Welcome to the app",
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: Media.height(context, space: .3),
                  left: Media.width(context, space: .18),
                  right: Media.width(context, space: .18),
                  bottom: 10,
                ),
                child: CustomButton(
                  text: "Login",
                  onPressed: () async {
                    // var dio = Dio();

                    // var headers = {
                    //   'Accept': 'application/json',
                    //   'Content-Type': 'application/json',
                    // };

                    // var data = {
                    //   'email': 'DASDASDSA2@gmail.com',
                    //   'password': '1221314ds',
                    // };

                    // try {
                    //   var response = await dio.post(
                    //     'http://testapi.alifouad91.com/api/login',
                    //     data: FormData.fromMap(data),
                    //     options: Options(headers: headers),
                    //   );

                    //   if (response.statusCode == 200) {
                    //     print(response.data);
                    //   } else {
                    //     print(
                    //         'Error: ${response.statusCode} - ${response.statusMessage}');
                    //   }
                    // } catch (e) {
                    //   print('Error: $e');
                    // }

                    Get.toNamed(AppRoute.login);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Media.width(context, space: .18)),
                child: CustomButton(
                  text: "Register",
                  backgroundColor: Colors.white,
                  textColor: AppColors.mainColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.register);
                  },
                ),
              ),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: RichTextWidget(
                thinText: 'Designed & Developmed by ',
                boldText: 'Ali Fouad',
                enableUnderlineText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
