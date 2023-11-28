import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/functions/media_query.dart';
import '../../../common/routes/pages.dart';
import '../../../controllers/home_controller.dart';
import '../list_tile_widget.dart';
import '../row_user_data.dart';

class LoadedHomeScreenWidget extends StatelessWidget {
  final HomeController controller;
  const LoadedHomeScreenWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getUser();
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: Media.height(context, space: .032),
              ),
              child: Column(
                children: [
                  RowDataWidget(
                    data: controller.userModel.data!.name!,
                    icon: Icons.person_outline_outlined,
                  ),
                  RowDataWidget(
                    data:
                        "${controller.userModel.data!.countryCode!} ${controller.userModel.data!.phone!}",
                    icon: Icons.phone_android_rounded,
                  ),
                  RowDataWidget(
                    data: controller.userModel.data!.email!,
                    icon: Icons.mail_outline_outlined,
                  ),
                  ListTileWidget(
                    title: "Update Information",
                    onTap: () {
                      Get.toNamed(AppRoute.update,
                          arguments: controller.userModel);
                    },
                  ),
                  ListTileWidget(
                    title: "Change Password",
                    onTap: () {
                      Get.toNamed(AppRoute.changePassword);
                    },
                  ),
                  ListTileWidget(
                    title: "Delete Account",
                    onTap: () {
                      controller.deleteUser();
                    },
                  ),
                  ListTileWidget(
                    title: "Logout",
                    onTap: () {
                      controller.logout();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
