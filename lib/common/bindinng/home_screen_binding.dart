import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../model/data/reposoity_pattern.dart';
import '../services/setting_services.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
 
    Get.put(HomeController(Services.sl!<AuthenticationUser>()));
  }
}
