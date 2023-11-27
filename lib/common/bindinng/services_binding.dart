import 'package:get/get.dart';

import '../services/setting_services.dart';
  
 
class ServicesAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Services());
  }
}
