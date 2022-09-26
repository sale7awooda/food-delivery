import 'dart:convert';

// To parse this JSON data, do
//
//     final cartModel = cartModelFromMap(jsonString);

CartModel cartModelFromMap(String str) => CartModel.fromMap(json.decode(str));

String cartModelToMap(CartModel data) => json.encode(data.toMap());

class CartModel {
  CartModel(
      {this.ostatus,
      this.oPHone,
      this.oAddress,
      this.foodResturantId,
      this.cartItems,
      this.oTotalPrice,
      this.oName,
      this.foodResturantName});

  String? ostatus;
  int? oPHone;
  String? oAddress;
  String? oName;
  String? foodResturantId;
  List<dynamic>? cartItems;
  int? oTotalPrice;
  String? foodResturantName;

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
      ostatus: json["ostatus"],
      oPHone: json["oPHone"],
      oAddress: json["oAddress"],
      oName: json["oName"],
      foodResturantId: json["foodResturantID"],
      cartItems: List<dynamic>.from(json["cartItems"].map((x) => x)),
      oTotalPrice: json["oTotalPrice"],
      foodResturantName: json["foodResturantName"]);

  Map<String, dynamic> toMap() => {
        "ostatus": ostatus,
        "oPHone": oPHone,
        "oAddress": oAddress,
        "oName":oName,
        "quantity": foodResturantId,
        "cartItems": List<dynamic>.from(cartItems!.map((x) => x)),
        "oTotalPrice": oTotalPrice,
        "foodResturantName": foodResturantName
      };
}

class CartItemClass {
  CartItemClass({
    required this.ffoodName,
    required this.foodId,
    required this.foodPrice,
  });

  String ffoodName;

  String foodId;
  int foodPrice;

  factory CartItemClass.fromMap(Map<String, dynamic> json) => CartItemClass(
        ffoodName: json["ffoodName"],
        foodId: json["foodID"],
        foodPrice: json["foodPrice"],
      );

  Map<String, dynamic> toMap() => {
        "ffoodName": ffoodName,
        "foodID": foodId,
        "foodPrice": foodPrice,
      };
}






































// class CartModel {
//   String? foodName;
//   String? foodDetails;
//   String? foodImageURL;
//   String? foodResturantID;
//   String? foodID;
//   int? foodPrice;
//   List<FoodModel>? orderitem = [];
//   //List? orderitem;
//   String? orderID;
//   String? oPHone;
//   String? oAddress;
//   int? quantity;

//   CartModel(
//       {this.foodName,
//       this.foodDetails,
//       this.foodImageURL,
//       this.foodResturantID,
//       this.foodID,
//       this.foodPrice,
//       this.orderID,
//       this.quantity,
//       this.oPHone,
//       this.oAddress,
//       this.orderitem});

//   static CartModel fromSnapShot(DocumentSnapshot snap) {
//     CartModel cartModel = CartModel(
//       foodID: snap['foodID'],
//       foodDetails: snap['foodDetails'],
//       foodImageURL: snap['foodImgUrl'],
//       foodName: snap['foodName'],
//       foodPrice: snap['foodPrice'],
//       foodResturantID: snap['foodResturantID'],
//       oPHone: snap['oPhone'],
//       oAddress: snap['oAddress'],
//       orderitem: snap['oItems'],
//       quantity: snap['quantity'],
//     );
//     return cartModel;
//   }

//   factory CartModel.fromFirestore(
//     DocumentSnapshot<Map<String, dynamic>> snapshot,
//     // SnapshotOptions? options,
//   ) {
//     final data = snapshot.data();
//     return CartModel(
//       foodID: data?['foodID'],
//       foodDetails: data?['foodDetails'],
//       foodImageURL: data?['foodImgUrl'],
//       foodName: data?['foodName'],
//       foodPrice: data?['foodPrice'],
//       foodResturantID: data?['foodResturantID'],
//       oPHone: data?['oPhone'],
//       oAddress: data?['oAddress'],
//       orderitem: data?['oItems'],
//       quantity: data?['quantity'],
//     );
//   }
//   Map<String, dynamic> toFirestore() {
//     return {};
//   }

//   // static CartModel fromSnapShot(DocumentSnapshot snap) {
//   //   CartModel cartModel = CartModel(
//   //       // foodID: snap['foodID'],
//   //       // foodDetails: snap['foodDetails'],
//   //       // foodImageURL: snap['foodImgUrl'],
//   //       // foodName: snap['foodName'],
//   //       // foodPrice: snap['foodPrice'],
//   //       // foodResturantID: snap['foodResturantID'],
//   //       oPHone: snap['oPhone'],
//   //       oAddress: snap['oAddress'],
//   //       orderitem: snap[FoodModel(
//   //           foodResturantID: "foodResturantID",
//   //           foodCategID: "foodCategID",
//   //           foodDetails: "foodDetails",
//   //           foodImageURL: "foodImageURL",
//   //           foodName: "foodName",
//   //           foodPrice: 1)],
//   //       quantity: snap['orderItemsQuantity']
//   //       // quantity: snap['ofderQuantity'],
//   //       );
//   //   return cartModel;
//   // }

//   // Map<String, dynamic> toMap() {
//   //   return {
//   //     'foodName': foodName,
//   //     'foodDetails': foodDetails,
//   //     'foodImageURL': foodImageURL,
//   //     'foodResturantID': foodResturantID,
//   //     'foodID': foodID,
//   //     'foodPrice': foodPrice,

//   //     'orderID': orderID,
//   //     // 'quantity': quantity,
//   //   };
//   // }

//   // factory CartModel.fromMap(Map<String, dynamic> map) {
//   //   return CartModel(
//   //       foodName: map['foodName'],
//   //       foodDetails: map['foodDetails'],
//   //       foodImageURL: map['foodImageURL'],
//   //       foodResturantID: map['foodResturantID'],
//   //       foodID: map['foodID'],
//   //       foodPrice: map['foodPrice']?.toInt(),

//   //       orderID: map['orderID'],
//   //       oPHone: map['oPhone'],
//   //       oAddress: map['oAddress'],
//   //       orderitem: map['orderItem']
//   //       // quantity: map['quantity']?.toInt(),
//   //       );
//   // }

//   // String toJson() => json.encode(toMap());

//   // factory CartModel.fromJson(String source) =>
//   //     CartModel.fromMap(json.decode(source));

 


  

//   Map<String, dynamic> toMap() {
//     return {
//       'foodName': foodName,
//       'foodDetails': foodDetails,
//       'foodImageURL': foodImageURL,
//       'foodResturantID': foodResturantID,
//       'foodID': foodID,
//       'foodPrice': foodPrice,
//       'orderitem': orderitem,
//       'orderID': orderID,
//       'oPHone': oPHone,
//       'oAddress': oAddress,
//       'quantity': quantity,
//     };
//   }

//   factory CartModel.fromMap(Map<String, dynamic> map) {
//     return CartModel(
//       // map['foodName'],
//       // map['foodDetails'],
//       // map['foodImageURL'],
//       // map['foodResturantID'],
//       // map['foodID'],
//       // map['foodPrice']?.toInt(),
//       // List<dynamic>.from(map['orderitem']),
//       // map['orderID'],
//       // map['oPHone'],
//       // map['oAddress'],
//       // map['quantity']?.toInt(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));
// }
