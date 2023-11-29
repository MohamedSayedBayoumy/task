import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../../model/data/reposoity_pattern.dart';
 

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final impel = Get.put(AuthenticationUserimplemention()) ;
    Get.put(LoginController(impel));
  }
}
