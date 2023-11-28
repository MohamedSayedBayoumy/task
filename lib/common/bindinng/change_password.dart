import 'package:get/get.dart';

import '../../controllers/change_password.dart';
import '../../model/data/reposoity_pattern.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    final impel = Get.put(AuthenticationUserimplemention());

    Get.put(ChangePasswordController(impel));
  }
}
