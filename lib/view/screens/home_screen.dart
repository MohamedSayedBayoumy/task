import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/eunm.dart';
import '../../controllers/home_controller.dart';
import '../widgets/home_widgets/failure_widget.dart';
import '../widgets/home_widgets/loaded_widget.dart';
import '../widgets/home_widgets/loading_widget.dart';
import '../../common/functions/media_query.dart';
import '../../common/widgets/custom_appbar.dart';

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
      body: GetBuilder<HomeController>(
        builder: (controller) {
          switch (controller.status) {
            case Status.loading:
              return const LoadingHomeScreenWidget();
            case Status.loaded:
              return LoadedHomeScreenWidget(
                controller: controller,
              );
            case Status.failure:
              return FaliureHomeScreenWidget(
                controller: controller,
              );
          }
        },
      ),
    );
  }
}
