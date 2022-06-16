import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orders/model/resturant_model.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore firestoreIns = FirebaseFirestore.instance;

  String restaurantCollectin = "Resturants";
  String categoriesCollectin = "Categories";
  String foodsCollectin = "Foods";
// String restaurantCollectin ="Restorants";
// String restaurantCollectin ="Restorants";
// String restaurantCollectin ="Restorants";
  static String fResturantName = 'restName';
  static String fResturantOwner = 'restOwner';
  static String fResturantPass = 'restPass';
  static String fResturantLoc = 'resLoc';
  static String fResturantDetails = 'restLoc';
  static String fResturantImg = 'restImg';

  addResturant(ResturantModel resturantModel) {
    firestoreIns.collection(restaurantCollectin).add({
      fResturantName: resturantModel.rname,
      fResturantOwner: resturantModel.rowner,
      fResturantPass: resturantModel.rpass,
      fResturantDetails: resturantModel.rdetial,
      fResturantLoc: resturantModel.rloc,
      fResturantImg: resturantModel.rimg,
    });
  }

  Future<List<ResturantModel>> loadResturants() async {
    var snapshot = await firestoreIns.collection(restaurantCollectin).get();
    List<ResturantModel> loadedrestaurants = [];
    for (var doc in snapshot.docs) {
      var data = doc.data();
      loadedrestaurants.add(ResturantModel(
          rname: data[fResturantName],
          rowner: data[fResturantOwner],
          rpass: data[fResturantPass],
          rloc: data[fResturantLoc],
          rdetial: data[fResturantDetails],
          rID: doc.id));
    }
    return loadedrestaurants;
  }

  removeResturant() {}
  updateResturant() {}
  addCategory() {}
  removeCategory() {}
  updateCategory() {}
  addFood() {}
  removeFood() {}
  updateFood() {}
  addOrder() {}
  updateOrder() {}
  removeOrder() {}
  clearCtrl() {}


  
}
