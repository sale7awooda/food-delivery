import 'package:get/get.dart';

import 'package:orders/logic/controller/firestore_controller.dart';

import '../controller/app_controller.dart';

class FirestoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirestoreController());
    // Get.put(CartController());
    Get.put(AppController());
  }
}
