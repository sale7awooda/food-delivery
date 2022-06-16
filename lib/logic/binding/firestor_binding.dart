import 'package:get/get.dart';

import 'package:orders/logic/controller/firestore_controller.dart';

class FirestoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirestoreController());
  }
}
