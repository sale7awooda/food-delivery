import 'package:get/get.dart';
import 'package:orders/logic/controller/app_controller.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(CartController());
    Get.put(AppController());
    //Get.put(FirestoreController());
    
  }
}
