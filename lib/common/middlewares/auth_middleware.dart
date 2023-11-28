import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task/common/routes/pages.dart';
import 'package:task/common/services/setting_services.dart';

class MiddleWareAuthentication extends GetMiddleware {

  Services myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (Services.sharedPreferences.getString("token") != "") {
      return const RouteSettings(name: AppRoute.home);
    }
    return null;
  }
}
