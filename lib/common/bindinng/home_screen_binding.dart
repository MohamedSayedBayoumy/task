import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../model/data/reposoity_pattern.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final impel = Get.put(AuthenticationUserimplemention());

    Get.put(HomeController(impel));
  }
}
