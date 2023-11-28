import 'package:get/get.dart';

import '../../model/models/set_user_parameter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  static late SharedPreferences sharedPreferences;

  Future<Services> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (Services.sharedPreferences.getString("token") == null) {
      Services.sharedPreferences.setString("token", "");
    }
    return this;
  }

  static setUser({
    SetUserParameterModel? setUserParameterModel,
  }) async {
    Services.sharedPreferences.setString("token", setUserParameterModel!.token);
    Services.sharedPreferences.setString("id", setUserParameterModel.id);
  }

  static SetUserParameterModel getUser() {
    return SetUserParameterModel(
      token: Services.sharedPreferences.getString("token").toString(),
      id: Services.sharedPreferences.getString("id").toString(),
    );
  }
}

initialServices() async {
  await Get.putAsync(() => Services().initialize());
}
