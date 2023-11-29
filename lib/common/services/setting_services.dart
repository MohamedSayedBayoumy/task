import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../model/data/reposoity_pattern.dart';
import '../../model/models/set_user_parameter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  static late SharedPreferences sharedPreferences;
  static GetIt? sl;
  Future<Services> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();

    sl = GetIt.asNewInstance();

    sl!.registerLazySingleton<AuthenticationUser>(
        () => AuthenticationUserimplemention());

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
