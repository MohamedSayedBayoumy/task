import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/constants/values/init_values.dart';
import '../common/eunm.dart';
import '../common/functions/alert_loading.dart';
import '../common/functions/snackbar.dart';
import '../common/routes/pages.dart';
import '../common/services/setting_services.dart';
import '../model/data/reposoity_pattern.dart';
import '../model/models/set_user_parameter_model.dart';
import '../model/models/user_model.dart';

class HomeController extends GetxController {
  Status status = Status.loading;

  final AuthenticationUser authenticationUser;

  UserModel userModel = UserModel();

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
    status = Status.loading;
    update();

    final result = await authenticationUser.getUser();
    result.fold((l) {
      status = Status.failure;
      if (l.failureMessag == InitalValues.unAuthUser) {
        showCustomSnackbar(
          title: "Failed",
          subTitle: "${l.failureMessag} , You need to login again",
          success: false,
          durationSeconds: 5,
        );
        Services.setUser(
            setUserParameterModel: SetUserParameterModel(token: "", id: ""));
        Get.offAllNamed(AppRoute.onBoarding);
      } else {
        failureMessage = l.failureMessag;
      }
      update();
    }, (r) {
      status = Status.loaded;
      userModel = r;
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
        success: true,
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
