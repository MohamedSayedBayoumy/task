import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/constants/colors.dart';
import 'package:task/common/eunm.dart';
import 'package:task/common/routes/pages.dart';
import 'package:task/controllers/home_controller.dart';

import '../../common/constants/fonts/fonts.dart';
import '../widgets/row_user_data.dart';
import '../widgets/list_tile_widget.dart';
import '../../common/functions/media_query.dart';
import '../../common/widgets/custom_appbar.dart';
import 'updata_information_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: CustomAppBar(
        title: "Home Page",
        height: Media.height(context, space: .09),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: Media.height(context, space: .032),
        ),
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(
            builder: (controller) {
              switch (controller.status) {
                case Status.loading:
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                    ),
                  );
                case Status.loaded:
                  return Column(
                    children: [
                      RowDataWidget(
                        data: controller.userModel.name!,
                        icon: Icons.person_outline_outlined,
                      ),
                      RowDataWidget(
                        data:
                            "${controller.userModel.countryCode!} ${controller.userModel.phone!}",
                        icon: Icons.phone_android_rounded,
                      ),
                      RowDataWidget(
                        data: controller.userModel.email!,
                        icon: Icons.mail_outline_outlined,
                      ),
                      ListTileWidget(
                        title: "Update Information",
                        onTap: () {
                          Get.toNamed(AppRoute.update , arguments: controller.userModel);
                        },
                      ),
                      ListTileWidget(
                        title: "Change Password",
                        onTap: () {},
                      ),
                      ListTileWidget(
                        title: "Delete Account",
                        onTap: () {},
                      ),
                      ListTileWidget(
                        title: "Logout",
                        onTap: () {},
                      ),
                    ],
                  );
                case Status.failure:
                  return Center(
                    child: Text(
                      controller.failureMessage,
                      style: Fonts.mainStyleBold.copyWith(
                        color: AppColors.failureColor,
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
