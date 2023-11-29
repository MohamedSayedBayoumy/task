import 'package:get/get.dart';

import '../../../controllers/register_controller.dart';
import '../../../model/data/reposoity_pattern.dart';
import '../../services/setting_services.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
 
    Get.put(RegisterController(Services.sl!<AuthenticationUser>()));
  }
}
