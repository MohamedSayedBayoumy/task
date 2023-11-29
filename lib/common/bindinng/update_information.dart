import 'package:get/get.dart';

import '../../controllers/update_controller.dart';
import '../../model/data/reposoity_pattern.dart';
import '../services/setting_services.dart';

class UpDateInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        UpDateInformationController(Services.sl!<AuthenticationUser>()));
  }
}
