import 'package:get/get.dart';

import '../../controllers/change_password.dart';
import '../../model/data/reposoity_pattern.dart';
import '../services/setting_services.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
 
    Get.put(ChangePasswordController(Services.sl!<AuthenticationUser>()));
  }
}
