import 'package:get/get.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/logic/controller/firestore_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(FirestoreController());
    
    
  }

}
