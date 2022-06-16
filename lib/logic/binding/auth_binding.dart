import 'package:get/get.dart';
import 'package:orders/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
   
    Get.put(AuthController());
  }

}
