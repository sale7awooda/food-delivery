import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String? foodName;
  String? foodDetails;
  String? foodImageURL;
  String? foodCategID;
  String? foodResturantID;
  String? foodID;
  int? foodPrice;
  String? fResturantName;
  String? fCategoryName;
  // bool? foodStatus = true;
  FoodModel({
    required this.foodResturantID,
    this.foodID,
    required this.fResturantName,
    required this.foodCategID,
    required this.foodDetails,
    required this.foodImageURL,
    required this.foodName,
    required this.foodPrice,
    required this.fCategoryName,
    
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
      fResturantName: snap['restName'],
      fCategoryName: snap['catName'],

      // static String fCategoryName = 'catName';
    );
    return foodModel;
  }


    factory FoodModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
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
      fResturantName: data?['restName'],
      fCategoryName: data?['catName'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
     
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'foodDetails': foodDetails,
      'foodImageURL': foodImageURL,
      'foodCategID': foodCategID,
      'foodResturantID': foodResturantID,
      'foodID': foodID,
      'foodPrice': foodPrice,
      'restName':fResturantName,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      foodName: map['foodName'],
      foodDetails: map['foodDetails'],
      foodImageURL: map['foodImageURL'],
      foodCategID: map['foodCategID'],
      foodResturantID: map['foodResturantID'],
      foodID: map['foodID'],
      foodPrice: map['foodPrice']?.toInt(),
      fResturantName: map['restName'],
      fCategoryName: map['catName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) => FoodModel.fromMap(json.decode(source));
}

