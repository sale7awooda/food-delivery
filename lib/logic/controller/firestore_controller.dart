import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orders/model/category_model.dart';
import 'package:orders/model/food_model.dart';
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

  static String fCategoryName = 'catName';
  static String fCategoryDetails = 'catDetail';
  static String fCategoryImg = 'catImg';
  static String fCategoryId = 'catID';
  static String fCategoryCode = 'catCode';

  static String ffoodName = 'foodName';
  static String ffoodDetails = 'foodDetails';
  static String ffoodImg = 'foodImgUrl';
  static String ffoodCategID = 'foodCategortID';
  static String ffoodResturantID = 'foodResturantID';
  static String ffoodID = 'foodID';
  static String ffoodPrice = 'foodPrice';
  static String ffoodTime = 'foodTime';
  static String ffoodStatus = 'foodStatus';

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

  Future<void> addCategory(CategoryModel categoryModel) async {
    await categoryCol.add({
      fCategoryName: categoryModel.cname,
      fCategoryDetails: categoryModel.cdetial,
      fCategoryCode: categoryModel.cCode,
      fCategoryImg: categoryModel.cimg,
    });
  }


  Future<void> addFood(FoodModel foodModel) async {
    await foodCol.add({
      ffoodName: foodModel.foodName,
      ffoodDetails: foodModel.foodDetails,
      ffoodImg: foodModel.foodImage,
      ffoodCategID: foodModel.foodCategID,
      ffoodResturantID: foodModel.foodResturantID,
      
      ffoodPrice: foodModel.foodPrice,
      ffoodTime: foodModel.foodTime,
      ffoodStatus: foodModel.foodStatus,
    });
  }

  Future<void> removeResturant(DocumentSnapshot doc) async {
    await restaurantCol.doc(doc.id).delete();
  }

  Future<void> removeCategory(DocumentSnapshot doc) async {
    await categoryCol.doc(doc.id).delete();
  }
  Future<void> removeFood(DocumentSnapshot doc) async {
    await foodCol.doc(doc.id).delete();
  }

  Future<void> updateResturant(
      DocumentSnapshot doc, ResturantModel resturantModel) async {
    await restaurantCol.doc(doc.id).update({
      fResturantName: resturantModel.rname,
      fResturantOwner: resturantModel.rowner,
      fResturantPass: resturantModel.rpass,
      fResturantDetails: resturantModel.rdetial,
      fResturantLoc: resturantModel.rloc,
      fResturantImg: resturantModel.rimg,
    });
  }

  Future<void> updateCategory(
      DocumentSnapshot doc, CategoryModel categoryModel) async {
    await categoryCol.doc(doc.id).update({
      fCategoryName: categoryModel.cname,
      fCategoryDetails: categoryModel.cdetial,
      fCategoryCode: categoryModel.cCode,
      fCategoryImg: categoryModel.cimg,
    });
  }
  Future<void> updateFood(
      DocumentSnapshot doc, FoodModel foodModel) async {
    await foodCol.doc(doc.id).update({
      ffoodName: foodModel.foodName,
      ffoodDetails: foodModel.foodDetails,
      ffoodImg: foodModel.foodImage,
      ffoodCategID: foodModel.foodCategID,
      ffoodResturantID: foodModel.foodResturantID,
      
      ffoodPrice: foodModel.foodPrice,
      ffoodTime: foodModel.foodTime,
      ffoodStatus: foodModel.foodStatus,
    });
  }

  
  
  addOrder() {}
  updateOrder() {}
  removeOrder() {}
}
