import 'package:get/get.dart';
 
import '../../controllers/update_controller.dart';
import '../../model/data/reposoity_pattern.dart';

class UpDateInformationBinding extends Bindings {
  @override
  void dependencies() {
    final impel = Get.put(AuthenticationUserimplemention());

    Get.put(UpDateInformationController(impel));
  }
}
