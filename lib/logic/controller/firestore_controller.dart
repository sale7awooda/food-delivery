import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fire_storage;
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orders/model/cart_model.dart';
import 'package:orders/model/category_model.dart';
import 'package:orders/model/food_model.dart';
import 'package:orders/model/resturant_model.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore firestoreIns = FirebaseFirestore.instance;
  final fire_storage.FirebaseStorage firestorageIns =
      fire_storage.FirebaseStorage.instance;

  static String fResturantName = 'restName';
  static String fResturantOwner = 'restOwner';
  static String fResturantStatus = 'restStatus';
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
  // static String ffoodStatus = 'foodStatus';
  static String ostatus = 'ostatus';
  static String ffoPhone = 'oPhone';
  static String ffoAddress = 'oAddress';
  static String ffoItems = 'oItems';
  static String oTotalPrice = 'oTotalPrice';
  String? itemIMG;
  RxInt pTotal = 0.obs;
  RxInt quantity = 0.obs;
  String restID = '';
  // ignore: prefer_typing_uninitialized_variables
  var deleteDOC;
  RxInt ordersCount = 0.obs;

  // int ordersCount = 0;

  // var price=0;

  final restaurantCol = FirebaseFirestore.instance.collection('restaurants');
  final categoryCol = FirebaseFirestore.instance.collection('categories');
  final foodCol = FirebaseFirestore.instance.collection('foods');
  final orderCol = FirebaseFirestore.instance.collection('orders');

  Future<void> addResturant(ResturantModel resturantModel) async {
    await restaurantCol.add({
      fResturantName: resturantModel.rname,
      fResturantOwner: resturantModel.rowner,
      fResturantStatus: resturantModel.rStatus,
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
      fResturantName: foodModel.fResturantName,
      fCategoryName: foodModel.fCategoryName,
      ffoodPrice: foodModel.foodPrice,
      // ffoodStatus: foodModel.foodStatus,
    });
  }

  Future<void> addFoodToCart(FoodModel foodModel, String cartID) async {
    await FirebaseFirestore.instance.collection(cartID).add({
      ffoodName: foodModel.foodName,
      ffoodDetails: foodModel.foodDetails,
      ffoodImg: foodModel.foodImageURL,
      ffoodCategID: foodModel.foodCategID,
      ffoodResturantID: foodModel.foodResturantID,
      ffoodPrice: foodModel.foodPrice,
      ffoodID: foodModel.foodID,
      fResturantName: foodModel.fResturantName,
    });
  }

  Future<void> addOrder(CartModel cartModel) async {
    await orderCol.add({
      // ffoodName: cartModel.foodName,
      // ffoodDetails: cartModel.foodDetails,
      // ffoodImg: cartModel.foodImageURL,
      // ffoodPrice: cartModel.foodPrice,
      // ffoodID: cartModel.foodID,
      ffoodResturantID: cartModel.foodResturantId,
      fResturantName: cartModel.foodResturantName,

      ostatus: cartModel.ostatus,
      ffoPhone: cartModel.oPHone,
      ffoAddress: cartModel.oAddress,
      ffoItems: FieldValue.arrayUnion(cartModel.cartItems!),
      oTotalPrice: cartModel.oTotalPrice,
      //cartModel.cartItems//{"key":"value"}
      // ffoodStatus: foodModel.foodStatus,
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

  Future<void> removeFoodFromCart(DocumentSnapshot doc, String cartID) async {
    await FirebaseFirestore.instance.collection(cartID).doc(doc.id).delete();
  }

  Future<void> updateResturant(
      DocumentSnapshot doc, ResturantModel resturantModel) async {
    await restaurantCol.doc(doc.id).update({
      fResturantName: resturantModel.rname,
      fResturantOwner: resturantModel.rowner,
      fResturantStatus: resturantModel.rStatus,
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
      fResturantName: foodModel.fResturantName,
      fCategoryName: foodModel.fCategoryName,
      // ffoodStatus: foodModel.foodStatus,
      ffoodID: foodModel.foodID,
    });
  }

  Future<void> updateOrder(DocumentSnapshot doc, CartModel cartModel) async {
    await orderCol.doc(doc.id).update({
      //  ffoodResturantID: cartModel.foodResturantId,
      ostatus: cartModel.ostatus,
      // ffoPhone: cartModel.oPHone,
      // ffoAddress: cartModel.oAddress,
      // ffoItems: FieldValue.arrayUnion(cartModel.cartItems!),
      // oTotalPrice: cartModel.oTotalPrice,
      // fResturantName:cartModel.foodResturantName,
    });
  }

  Future<void> deleteAllColl(DocumentSnapshot doc, String cartID) async {
    await FirebaseFirestore.instance
        .collection(cartID)
        .get()
        .then((querySnapshot) {
      for (var snapshot in querySnapshot.docs) {
        snapshot.reference.delete();
      }
    });
  }

  Future<void> getTotalPrice(DocumentSnapshot doc, String cartID) async {
    await FirebaseFirestore.instance
        .collection(cartID)
        .get()
        .then((querySnapshot) {
      for (var snapshot in querySnapshot.docs) {
        pTotal += snapshot.get(ffoodPrice);

        //     //pTotal = pTotal + pTotal.toInt();
      }
    });
  }

  removeOrder() {}

  // Future<List<DocumentSnapshot>> getResturants() {
  //   return restaurantCol.get().then(
  //     (snaps) {
  //       return snaps.docs;
  //     },
  //   );
  // }

  // Future getRestDetails(String restID) async {
  //   await FirebaseFirestore.instance
  //       .collection('restaurants')
  //       .where('restOwner', isEqualTo: restID)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       //print(loginEmail+" loginEmail");
  //       // print(doc.id);
  //     }
  //   });

  //   // String restOwnerName = snap[fResturantOwner];
  //   // return restOwnerName;
  // }

  Future<String> uploadImage(PlatformFile file, String imgREF) async {
    try {
      fire_storage.TaskSnapshot upload = await fire_storage
          .FirebaseStorage.instance
          .ref('$imgREF/${file.name}')
          .putData(
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

  // Stream<List<FoodModel>> ordersList(String cartID) {
  //   return FirebaseFirestore.instance
  //       .collection(cartID)
  //       .snapshots()
  //       .map((snapShot) => snapShot.docs)
  //       ;
  // }
}
