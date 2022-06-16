import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orders/model/resturant_model.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore firestoreIns = FirebaseFirestore.instance;

  // String restaurantCollectin = 'Resturants';
  // String categoriesCollectin = "Categories";
  // String foodsCollectin = "Foods";
// String restaurantCollectin ="Restorants";
// String restaurantCollectin ="Restorants";
// String restaurantCollectin ="Restorants";
  static String fResturantName = 'restName';
  static String fResturantOwner = 'restOwner';
  static String fResturantPass = 'restPass';
  static String fResturantLoc = 'resLoc';
  static String fResturantDetails = 'restDetail';
  static String fResturantImg = 'restImg';

  final restaurantCol = FirebaseFirestore.instance.collection('restaurants');
  final categoryCol = FirebaseFirestore.instance.collection('categories');
  final foodCol = FirebaseFirestore.instance.collection('foods');

  Future<void> addResturant(ResturantModel resturantModel) async {
    await restaurantCol.add({
      fResturantName: resturantModel.rname,
      fResturantOwner: resturantModel.rowner,
      fResturantPass: resturantModel.rpass,
      fResturantDetails: resturantModel.rdetial,
      fResturantLoc: resturantModel.rloc,
      fResturantImg: resturantModel.rimg,
    });
  }

  Future<void> removeResturant(DocumentSnapshot doc) async {
    await restaurantCol.doc(doc.id).delete();
  }

  Future<void> updateResturant( DocumentSnapshot doc,ResturantModel resturantModel) async {
    await restaurantCol.doc(doc.id).update({
      fResturantName: resturantModel.rname,
      fResturantOwner: resturantModel.rowner,
      fResturantPass: resturantModel.rpass,
      fResturantDetails: resturantModel.rdetial,
      fResturantLoc: resturantModel.rloc,
      fResturantImg: resturantModel.rimg,
    });
  }

  addCategory() {}
  removeCategory() {}
  updateCategory() {}
  addFood() {}
  removeFood() {}
  updateFood() {}
  addOrder() {}
  updateOrder() {}
  removeOrder() {}
}
