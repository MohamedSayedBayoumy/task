// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_overrides
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task/common/routes/pages.dart';

import '../common/eunm.dart';
import '../common/functions/alert_loading.dart';
import '../common/functions/snackbar.dart';
import '../common/services/setting_services.dart';
import '../model/data/reposoity_pattern.dart';
import '../model/models/set_user_parameter_model.dart';
import '../model/models/user_model.dart';

class HomeController extends GetxController {
  Status status = Status.loading;

  final AuthenticationUser authenticationUser;

  UserData userModel = UserData();

  HomeController(this.authenticationUser);

  String failureMessage = "";

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUser();
    });
  }

  Future getUser() async {
    final result = await authenticationUser.getUser();
    result.fold((l) {
      status = Status.failure;
      failureMessage = l.failureMessag;
      update();
    }, (r) {
      status = Status.loaded;
      userModel = r;
      print(r.toJson());
      update();
    });
  }

  Future deleteUser() async {
    showLoadingDialog();

    final result = await authenticationUser.deleteAccount();

    result.fold((l) {
      showCustomSnackbar(
        title: "Failed",
        subTitle: l.failureMessag,
        success: false,
      );
    }, (r) {
      showCustomSnackbar(
        title: "Success",
        subTitle: r.message!,
        success: false,
      );

      Get.toNamed(AppRoute.onBoarding);
    });
  }

  Future logout() async {
    showLoadingDialog();
    await Services.setUser(
        setUserParameterModel: SetUserParameterModel(token: "", id: ""));
    Future.delayed(const Duration(seconds: 1), () {
      showCustomSnackbar(
        title: "Success",
        subTitle: "Log out Successfully ",
        success: true,
      );
      Get.offAllNamed(AppRoute.onBoarding);
    });
  }
}
