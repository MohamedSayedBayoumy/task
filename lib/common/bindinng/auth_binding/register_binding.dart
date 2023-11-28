import 'package:get/get.dart';

import '../../../controllers/register_controller.dart';
import '../../../model/data/reposoity_pattern.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    final impel = Get.put(AuthenticationUserimplemention());

    Get.put(RegisterController(impel));
  }
}
