import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fire_storage;
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orders/model/category_model.dart';
import 'package:orders/model/food_model.dart';
import 'package:orders/model/resturant_model.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore firestoreIns = FirebaseFirestore.instance;
  final fire_storage.FirebaseStorage firestorageIns =
      fire_storage.FirebaseStorage.instance;

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
  String itemIMG = '';

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
      fResturantImg: resturantModel.rimgURL,
    });
  }

  Future<void> addCategory(CategoryModel categoryModel) async {
    await categoryCol.add({
      fCategoryName: categoryModel.cname,
      fCategoryDetails: categoryModel.cdetial,
      // fCategoryCode: categoryModel.cCode,
      fCategoryImg: categoryModel.cimgURL,
    });
  }

  Future<void> addFood(FoodModel foodModel) async {
    await foodCol.add({
      ffoodName: foodModel.foodName,
      ffoodDetails: foodModel.foodDetails,
      ffoodImg: foodModel.foodImageURL,
      ffoodCategID: foodModel.foodCategID,
      ffoodResturantID: foodModel.foodResturantID,
      ffoodPrice: foodModel.foodPrice,
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
      fResturantImg: resturantModel.rimgURL,
    });
  }

  Future<void> updateCategory(
      DocumentSnapshot doc, CategoryModel categoryModel) async {
    await categoryCol.doc(doc.id).update({
      fCategoryName: categoryModel.cname,
      fCategoryDetails: categoryModel.cdetial,
      // fCategoryCode: categoryModel.cCode,
      fCategoryImg: categoryModel.cimgURL,
    });
  }

  Future<void> updateFood(DocumentSnapshot doc, FoodModel foodModel) async {
    await foodCol.doc(doc.id).update({
      ffoodName: foodModel.foodName,
      ffoodDetails: foodModel.foodDetails,
      ffoodImg: foodModel.foodImageURL,
      ffoodCategID: foodModel.foodCategID,
      ffoodResturantID: foodModel.foodResturantID,
      ffoodPrice: foodModel.foodPrice,
      ffoodStatus: foodModel.foodStatus,
    });
  }

  addOrder() {}
  updateOrder() {}
  removeOrder() {}

  Future<List<DocumentSnapshot>> getResturants() {
    return restaurantCol.get().then(
      (snaps) {
        return snaps.docs;
      },
    );
  }

  Future<List<DocumentSnapshot>> getCategories() {
    return categoryCol.get().then(
      (snaps) {
        return snaps.docs;
      },
    );
  }

  Future<String> uploadImage(PlatformFile file,String imgREF) async {
    try {
      fire_storage.TaskSnapshot upload =
          await fire_storage.FirebaseStorage.instance.ref('$imgREF/${file.name}').putData(
                file.bytes!,
                fire_storage.SettableMetadata(
                    contentType: 'image/${file.extension}'),
              );

      String itemurl = await upload.ref.getDownloadURL();
      

      return itemurl;
    } catch (e) {
      Get.snackbar("Error", e.toString());

      return '';
    }
  }

  final fstorageINS = fire_storage.FirebaseStorage.instance;
  Future<fire_storage.ListResult> listImgs(String imgREF) async {
    fire_storage.ListResult results = await fstorageINS.ref(imgREF).listAll();
    results.items.forEach((fire_storage.Reference ref) {
      print(ref);
    });
    return results;
  }
  Future<String> dwnlodURL (String imageName ,String imgREF) async{
    String dwnlodURL = await  fstorageINS.ref('$imgREF/$imageName').getDownloadURL() ;
    return dwnlodURL;
  }
}
