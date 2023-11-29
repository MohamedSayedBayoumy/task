import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../../model/data/reposoity_pattern.dart';
import '../../services/setting_services.dart';
 

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(Services.sl!<AuthenticationUser>()));
  }
}
