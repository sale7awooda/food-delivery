import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String? foodName;
  String? foodDetails;
  String? foodImageURL;
  String? foodCategID;
  String? foodResturantID;
  String? foodID;
  int? foodPrice;
  bool? foodStatus = true;
  FoodModel({
    required this.foodResturantID,
    this.foodID,
    required this.foodCategID,
    required this.foodDetails,
    required this.foodImageURL,
    required this.foodName,
    required this.foodPrice,
    this.foodStatus,
  });

  static FoodModel fromSnapShot(DocumentSnapshot snap) {
    FoodModel foodModel = FoodModel(
      foodID: snap['foodID'],
      foodCategID: snap['foodCategortID'],
      foodDetails: snap['foodDetails'],
      foodImageURL: snap['foodImgUrl'],
      foodName: snap['foodName'],
      foodPrice: snap['foodPrice'],
      foodResturantID: snap['foodResturantID'],
    );
    return foodModel;
  }


    factory FoodModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FoodModel(
      foodID: data?['foodID'],
      foodCategID: data?['foodCategortID'],
      foodDetails: data?['foodDetails'],
      foodImageURL: data?['foodImgUrl'],
      foodName: data?['foodName'],
      foodPrice: data?['foodPrice'],
      foodResturantID: data?['foodResturantID'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
     
    };
  }
}

