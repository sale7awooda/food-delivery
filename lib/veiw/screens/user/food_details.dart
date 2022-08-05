// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/food_model.dart';
//  import 'package:orders/model/food_model.dart';
// import 'package:orders/routes/routes.dart';

import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';
// import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  //int quantity = 0;
  final fstoreCtrl = Get.find<FirestoreController>();
  final authCtrl = Get.find<AuthController>();
  //final cartCtrl = Get.find<CartController>();
  dynamic argumnts = Get.arguments;

  //var sfoodID = Get.arguments;

  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    var cartID = authCtrl.cartid;

    String ffoodName = 'foodName';
    String ffoodDetails = 'foodDetails';
    String ffoodImg = 'foodImgUrl';
    String ffoodCategID = 'foodCategortID';
    String ffoodResturantID = 'foodResturantID';
    String fResturantName = 'restName';
    String fCategoryName = 'catName';
    String ffoodPrice = 'foodPrice';

    String ffoodID = argumnts[0];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: fstoreCtrl.foodCol
                .where('foodID', isEqualTo: ffoodID)
                .snapshots(),
            //initialData: initialData,
            builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
              if (streamSnapshot.hasData) {
                return !streamSnapshot.hasData
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        //controller: scrollctrl,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot foodSnapshot =
                              streamSnapshot.data!.docs[index];
                          var fid = foodSnapshot;

                          return Stack(
                            children: [
                              FoodDtlsWdgt(
                                  ffoodImgURL: foodSnapshot[ffoodImg],
                                  ffoodName: foodSnapshot[ffoodName],
                                  ffoodDetails: foodSnapshot[ffoodDetails],
                                  authCtrl: authCtrl,
                                  fstoreCtrl: fstoreCtrl,
                                  cartid: authCtrl.cartid,
                                  foodModel: FoodModel(
                                      foodImageURL: foodSnapshot[ffoodImg],
                                      foodName: foodSnapshot[ffoodName],
                                      foodDetails: foodSnapshot[ffoodDetails],
                                      foodID: ffoodID, //foodSnapshot.id,
                                      foodCategID: foodSnapshot[ffoodCategID],
                                      foodPrice: foodSnapshot[ffoodPrice],
                                      foodResturantID:
                                          foodSnapshot[ffoodResturantID],
                                      fResturantName:
                                          foodSnapshot[fResturantName],
                                      fCategoryName:
                                          foodSnapshot[fCategoryName])),

                              // Positioned(
                              //     left: 50,
                              //     bottom: 150,
                              //     child: IconButton(
                              //         onPressed: () {
                              //           setState(() {
                              //             fstoreCtrl.getTotalPrice(
                              //                 Fid, authCtrl.cartid);
                              //           });
                              //         },
                              //         icon: const Icon(Icons.refresh)))
                              // Center(child: Text(fstoreCtrl.price.toString())),
                            ],
                          );
                        });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })
        // fooddtlswdgt(ffoodImgURL: ffoodImgURL, ffoodName: ffoodName, ffoodDetails: ffoodDetails),
        );
  }
}

class FoodDtlsWdgt extends StatelessWidget {
  const FoodDtlsWdgt({
    Key? key,
    required this.ffoodImgURL,
    required this.ffoodName,
    required this.ffoodDetails,
    required this.fstoreCtrl,
    required this.authCtrl,
    required this.foodModel,
    required this.cartid,
    //required this.delete,
  }) : super(key: key);

  final String ffoodImgURL;
  final String ffoodName;
  final String ffoodDetails;
  final FirestoreController fstoreCtrl;
  final AuthController authCtrl;
  final FoodModel foodModel;
  final String cartid;
  //final Callback delete;

  // final CartController cartCtrl;
  // final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const SizedBox(height: 10),
          Center(
              child: Stack(children: [
            ImageNetwork(
              image: ffoodImgURL,
              height: 250,
              width: 250,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.cover,
            )
          ])),
          const SizedBox(height: 20),
          TextUtils(
              text: ffoodName,
              fontsize: 20,
              fontweight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(textAlign: TextAlign.center, ffoodDetails))),
          const SizedBox(height: 20),
          ButtonWdgt(
              text: "اضف للسلة",
              onPress: () {
                fstoreCtrl.addFoodToCart(foodModel, cartid);
                Get.snackbar("إضافه عنصر", "تمت الإضافة بنجاح",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 2));
                //Get.toNamed(Routes.myordersScreen, arguments: []);
                // print(authctrl.displayUsername.toString());
              }),
          //TextButton(onPressed: () => delete(), child: const Text("delete"))
          //ButtonWdgt(text: "delete", onPress: delete)
        ]));
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_network/image_network.dart';
// import 'package:orders/logic/controller/cart_controller.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';
// import 'package:orders/routes/routes.dart';

// import 'package:orders/utils/theme.dart';
// import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';
// import 'package:orders/veiw/widgets/user/text_utils.dart';

// class FoodDetailsScreen extends StatefulWidget {
//   const FoodDetailsScreen({Key? key}) : super(key: key);

//   @override
//   State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
// }

// class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
//   //int quantity = 0;
//   final fstoreCtrl = Get.find<FirestoreController>();
//   final cartCtrl = Get.find<CartController>();
//   dynamic argumnts = Get.arguments;

//   // ignore: unused_field

//   @override
//   Widget build(BuildContext context) {
//     String ffoodImgURL = argumnts[3];
//     String ffoodName = argumnts[1];
//     String ffoodDetails = argumnts[2];
//     String ffoodPrice = argumnts[4];
//     String ffoodID = argumnts[0];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         elevation: 0,
//         title: const Text(" FOOD DELIVERY"),
//         centerTitle: true,
//         //actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),],
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           const SizedBox(height: 10),
//           Center(
//               child: Stack(children: [
//             ImageNetwork(
//               image: ffoodImgURL,
//               height: 250,
//               width: 250,
//               fitAndroidIos: BoxFit.cover,
//               fitWeb: BoxFitWeb.cover,
//             )
//           ])),
//           const SizedBox(height: 20),
//           TextUtils(
//               text: ffoodName,
//               fontsize: 20,
//               fontweight: FontWeight.normal,
//               color: mainColor,
//               underLine: TextDecoration.none),
//           const SizedBox(height: 20),
//           FoodDetailsText(txtDetail: ffoodDetails),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       IconButton(
//           //           onPressed: () {
//           //             setState(() {
//           //               quantity++;
//           //             });
//           //           },
//           //           icon: const Icon(Icons.add)),
//           //       Text(
//           //         quantity.toString(),
//           //         style: const TextStyle(fontSize: 20),
//           //       ),
//           //       IconButton(
//           //           onPressed: () {
//           //             setState(() {
//           //               if (quantity != 0) {
//           //                 quantity--;
//           //               } else {}
//           //             });
//           //           },
//           //           icon: const Icon(Icons.remove)),
//           //     ],
//           //   ),
//           // ),
//           const SizedBox(height: 20),
//           ButtonWdgt(text: "اضف للسلة", onPress: () {//Get.toNamed(Routes.myordersScreen, arguments: []);cartCtrl.itemsCount.value+1;
//             //cartCtrl.addOneFood(foodModel);
//           })
//         ]),
//       ),
//     );
//   }
// }

// class FoodDetailsText extends StatelessWidget {
//   FoodDetailsText({Key? key, this.txtDetail}) : super(key: key);
//   String? txtDetail;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Container(
//             padding: const EdgeInsets.all(20),
//             width: double.infinity,
//             height: 200,
//             decoration: BoxDecoration(
//                 color: Colors.black38, borderRadius: BorderRadius.circular(20)),
//             child: Text(textAlign: TextAlign.center, txtDetail!)
//             // const Center(
//             //     child: Text(
//             //         textAlign: TextAlign.center,
//             //         "food item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Details")),
//             ));
//   }
// }
