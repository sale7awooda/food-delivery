import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String? foodName,
      foodDetails,
      foodImageURL,
      foodCategID,
      foodResturantID,
      foodID;
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
      foodID: snap['foodCategortID'],
      foodCategID: snap['foodCategortID'],
      foodDetails: snap['foodDetails'],
      foodImageURL: snap['foodImgUrl'],
      foodName: snap['foodName'],
      foodPrice: snap['foodPrice'],
      foodResturantID: snap['foodResturantID'],
    );
    return foodModel;
  }
}
