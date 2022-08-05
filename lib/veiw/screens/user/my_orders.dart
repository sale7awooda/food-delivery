import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/cart_model.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/admin/text_form_wdgt.dart';
import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/veiw/widgets/user/orders_cart/cart_item_card.dart';
import 'package:orders/veiw/widgets/user/orders_cart/empty_cart.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);
  static String ffoPhone = 'oPhone';
  static String ffoAddress = 'oAddress';
  static String ffoItems = 'oItems';
  static String ffoodID = 'foodID';

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  //final fstoreCtrl = Get.find<FirestoreController>();
  final authctrl = Get.find<AuthController>();

  final fstoreCtrl = Get.find<FirestoreController>();
  final scrollCtrl = ScrollController();
  final scrollCtrl2 = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final String ffoodName = 'foodName';

  final String ffoodDetails = 'foodDetails';

  final String ffoodImg = 'foodImgUrl';

  final String ffoodResturantID = 'foodResturantID';
  final String fResturantName = 'restName';

  final String ffoodPrice = 'foodPrice';

  bool visaState1 = true;

  // bool visaState2 = false;
  final orderPhoneCtrl = TextEditingController();

  final orderAddressCtrl = TextEditingController();

  //final idCtrl = TextEditingController();
  final nCtrl = TextEditingController();
  final nCtrl1 = TextEditingController();
  final nCtrl2 = TextEditingController();
  final nCtrl3 = TextEditingController();
  final nCtrl4 = TextEditingController();
  final pCtrl = TextEditingController();
  final pCtrl1 = TextEditingController();
  final pCtrl2 = TextEditingController();
  final pCtrl3 = TextEditingController();
  final pCtrl4 = TextEditingController();
  final ridCtrl = TextEditingController();
  final rNameCtrl = TextEditingController();

  clearCtrl() {
    //  idCtrl.clear();
    nCtrl.clear();
    nCtrl1.clear();
    nCtrl2.clear();
    nCtrl3.clear();
    nCtrl4.clear();
    pCtrl.clear();
    pCtrl1.clear();
    pCtrl2.clear();
    pCtrl3.clear();
    pCtrl4.clear();
    ridCtrl.clear();
    rNameCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    var cartID = authctrl.cartid;
    int oTotalPrice = 0;

    // int pcount=0;
    // DocumentSnapshot<Object?>? ordersList;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(children: [
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: scrollCtrl,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(cartID)
                          .snapshots(),
                      //initialData: initialData,
                      builder:
                          (BuildContext context, AsyncSnapshot streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return !streamSnapshot.hasData
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollCtrl2,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot foodSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    fstoreCtrl.deleteDOC = foodSnapshot;
                                    int selector =
                                        streamSnapshot.data!.docs.length;
                                    //List<dynamic> listlingth= List.from(foodSnapshot['ffoodName']);

                                    switch (selector) {
                                      case 1:
                                        {
                                          rNameCtrl.text = streamSnapshot
                                              .data!.docs[0][fResturantName];
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          pCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodPrice]
                                              .toString();
                                          oTotalPrice = streamSnapshot
                                              .data!.docs[0][ffoodPrice];
                                        }
                                        break;
                                      case 2:
                                        {
                                          rNameCtrl.text = streamSnapshot
                                              .data!.docs[0][fResturantName];
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          pCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodPrice]
                                              .toString();
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          pCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodPrice]
                                              .toString();
                                          oTotalPrice = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice] +
                                              streamSnapshot.data!.docs[1]
                                                  [ffoodPrice]);
                                        }
                                        break;
                                      case 3:
                                        {
                                          rNameCtrl.text = streamSnapshot
                                              .data!.docs[0][fResturantName];
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          pCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodPrice]
                                              .toString();
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          pCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodPrice]
                                              .toString();
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          pCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodPrice]
                                              .toString();
                                          oTotalPrice = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice] +
                                              streamSnapshot.data!.docs[1]
                                                  [ffoodPrice] +
                                              streamSnapshot.data!.docs[2]
                                                  [ffoodPrice]);
                                        }
                                        break;
                                      case 4:
                                        {
                                          rNameCtrl.text = streamSnapshot
                                              .data!.docs[0][fResturantName];
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          pCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodPrice]
                                              .toString();
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          pCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodPrice]
                                              .toString();
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          pCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodPrice]
                                              .toString();
                                          nCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodName];
                                          pCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodPrice]
                                              .toString();
                                          oTotalPrice = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice] +
                                              streamSnapshot.data!.docs[1]
                                                  [ffoodPrice] +
                                              streamSnapshot.data!.docs[2]
                                                  [ffoodPrice] +
                                              streamSnapshot.data!.docs[3]
                                                  [ffoodPrice]);
                                        }
                                        break;
                                      case 5:
                                        {
                                          rNameCtrl.text = streamSnapshot
                                              .data!.docs[0][fResturantName];
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          pCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodPrice]
                                              .toString();
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          pCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodPrice]
                                              .toString();
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          pCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodPrice]
                                              .toString();
                                          nCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodName];
                                          pCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodPrice]
                                              .toString();
                                          nCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodName];
                                          pCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodPrice]
                                              .toString();
                                          oTotalPrice = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice] +
                                              streamSnapshot.data!.docs[1]
                                                  [ffoodPrice] +
                                              streamSnapshot.data!.docs[2]
                                                  [ffoodPrice] +
                                              streamSnapshot.data!.docs[3]
                                                  [ffoodPrice] +
                                              streamSnapshot.data!.docs[4]
                                                  [ffoodPrice]);
                                        }
                                        break;

                                      default:
                                    }
                                    //  do {
                                    //    visaState1=false;
                                    //  } while (index <= (selector-2));

                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 40),
                                        child: InkWell(
                                            hoverColor: Colors.lightBlue[200],
                                            onTap: () {},
                                            child: Column(
                                              children: [
                                                Stack(
                                                  children: [
                                                    CartItemCard(
                                                        ffoodName: foodSnapshot[
                                                            ffoodName],
                                                        ffoodImg: foodSnapshot[
                                                            ffoodImg],
                                                        ffoodPrice:
                                                            foodSnapshot[
                                                                ffoodPrice]),
                                                    Positioned(
                                                        top: 15,
                                                        left: 15,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              fstoreCtrl.removeFoodFromCart(
                                                                  foodSnapshot,
                                                                  authctrl
                                                                      .cartid);
                                                            },
                                                            icon: const Icon(
                                                                Icons.close,
                                                                size: 30,
                                                                color:
                                                                    redClr))),
                                                  ],
                                                ),
                                              ],
                                            )));
                                  });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                      key: _formKey,
                      child: SizedBox(
                        child: Column(children: [
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection(cartID)
                                  .snapshots(),
                              //initialData: initialData,
                              builder: (BuildContext context,
                                  AsyncSnapshot streamSnapshot) {
                                if (streamSnapshot.hasData) {
                                  int itemCount = 0;
                                  if (streamSnapshot.data!.docs.length >= 1) {
                                    itemCount = 1;
                                  }
                                  return !streamSnapshot.hasData
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          //controller: scrollctrl,
                                          itemCount: itemCount,
                                          itemBuilder: (context, index) {
                                            // final DocumentSnapshot
                                            var itemsLenght = streamSnapshot
                                                .data!.docs.length;

                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary:
                                                                    mainColor,
                                                                minimumSize:
                                                                    const Size(
                                                                        100,
                                                                        50),
                                                                maximumSize:
                                                                    const Size(
                                                                        200,
                                                                        50)),
                                                        child:
                                                            const Text("طلب"),
                                                        onPressed: () {
                                                          Get.defaultDialog(
                                                            cancel: ButtonWdgt(
                                                              text: "تراجع",
                                                              onPress: () {
                                                                Get.back();
                                                              },
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            titleStyle:
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                            confirm: ButtonWdgt(
                                                              text: "تاكيد",
                                                              onPress:
                                                                  () async {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  _formKey
                                                                      .currentState!
                                                                      .save();
                                                                  switch (
                                                                      itemsLenght) {
                                                                    case 1:
                                                                      await fstoreCtrl
                                                                          .addOrder(
                                                                              CartModel(
                                                                        foodResturantId:
                                                                            ridCtrl.text,
                                                                        oTotalPrice:
                                                                            oTotalPrice,
                                                                        foodResturantName:
                                                                            rNameCtrl.text,
                                                                        oPHone:
                                                                            int.tryParse(orderPhoneCtrl.text),
                                                                        oAddress:
                                                                            orderAddressCtrl.text,
                                                                        cartItems: [
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl.text),
                                                                          }
                                                                        ],
                                                                      ));
                                                                      clearCtrl();
                                                                      Get.back();
                                                                      fstoreCtrl.deleteAllColl(
                                                                          fstoreCtrl
                                                                              .deleteDOC,
                                                                          cartID);
                                                                      Get.snackbar(
                                                                          "تنبية",
                                                                          "تم ارسال الطلب",
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM);

                                                                      break;
                                                                    case 2:
                                                                      await fstoreCtrl
                                                                          .addOrder(
                                                                              CartModel(
                                                                        foodResturantId:
                                                                            ridCtrl.text,
                                                                        foodResturantName:
                                                                            rNameCtrl.text,
                                                                        oTotalPrice:
                                                                            oTotalPrice,
                                                                        oPHone:
                                                                            int.tryParse(orderPhoneCtrl.text),
                                                                        oAddress:
                                                                            orderAddressCtrl.text,
                                                                        cartItems: [
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl1.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl1.text),
                                                                          },
                                                                          // {
                                                                          //   ffoodName:
                                                                          //       nCtrl1.text
                                                                          // }
                                                                        ],
                                                                      ));
                                                                      clearCtrl();
                                                                      Get.back();
                                                                      fstoreCtrl.deleteAllColl(
                                                                          fstoreCtrl
                                                                              .deleteDOC,
                                                                          cartID);
                                                                      Get.snackbar(
                                                                          "تنبية",
                                                                          "تم ارسال الطلب",
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM);

                                                                      break;
                                                                    case 3:
                                                                      await fstoreCtrl
                                                                          .addOrder(
                                                                              CartModel(
                                                                        foodResturantId:
                                                                            ridCtrl.text,
                                                                        foodResturantName:
                                                                            rNameCtrl.text,
                                                                        oTotalPrice:
                                                                            oTotalPrice,
                                                                        oPHone:
                                                                            int.tryParse(orderPhoneCtrl.text),
                                                                        oAddress:
                                                                            orderAddressCtrl.text,
                                                                        cartItems: [
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl1.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl1.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl2.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl2.text),
                                                                          },
                                                                          // {
                                                                          //   ffoodName:
                                                                          //       nCtrl2.text
                                                                          // }
                                                                        ],
                                                                      ));
                                                                      clearCtrl();
                                                                      Get.back();
                                                                      fstoreCtrl.deleteAllColl(
                                                                          fstoreCtrl
                                                                              .deleteDOC,
                                                                          cartID);
                                                                      Get.snackbar(
                                                                          "تنبية",
                                                                          "تم ارسال الطلب",
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM);
                                                                      break;
                                                                    case 4:
                                                                      await fstoreCtrl
                                                                          .addOrder(
                                                                              CartModel(
                                                                        foodResturantId:
                                                                            ridCtrl.text,
                                                                        foodResturantName:
                                                                            rNameCtrl.text,
                                                                        oTotalPrice:
                                                                            oTotalPrice,
                                                                        oPHone:
                                                                            int.tryParse(orderPhoneCtrl.text),
                                                                        oAddress:
                                                                            orderAddressCtrl.text,
                                                                        cartItems: [
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl1.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl1.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl2.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl2.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl3.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl3.text),
                                                                          },
                                                                          // {
                                                                          //   ffoodName:
                                                                          //       nCtrl4.text
                                                                          //       ,ffoodPrice:int.tryParse(pCtrl4.text),
                                                                          // }
                                                                        ],
                                                                      ));
                                                                      clearCtrl();
                                                                      Get.back();
                                                                      fstoreCtrl.deleteAllColl(
                                                                          fstoreCtrl
                                                                              .deleteDOC,
                                                                          cartID);
                                                                      Get.snackbar(
                                                                          "تنبية",
                                                                          "تم ارسال الطلب",
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM);

                                                                      break;
                                                                    case 5:
                                                                      await fstoreCtrl
                                                                          .addOrder(
                                                                              CartModel(
                                                                        foodResturantId:
                                                                            ridCtrl.text,
                                                                        foodResturantName:
                                                                            rNameCtrl.text,
                                                                        oTotalPrice:
                                                                            oTotalPrice,
                                                                        oPHone:
                                                                            int.tryParse(orderPhoneCtrl.text),
                                                                        oAddress:
                                                                            orderAddressCtrl.text,
                                                                        cartItems: [
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl1.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl1.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl2.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl2.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl3.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl3.text),
                                                                          },
                                                                          {
                                                                            ffoodName:
                                                                                nCtrl4.text,
                                                                            ffoodPrice:
                                                                                int.tryParse(pCtrl4.text),
                                                                          },
                                                                          // {
                                                                          //   ffoodName:
                                                                          //       nCtrl4.text
                                                                          // }
                                                                        ],
                                                                      ));
                                                                      clearCtrl();
                                                                      Get.back();
                                                                      fstoreCtrl.deleteAllColl(
                                                                          fstoreCtrl
                                                                              .deleteDOC,
                                                                          cartID);
                                                                      Get.snackbar(
                                                                          "تنبية",
                                                                          "تم ارسال الطلب",
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM);
                                                                      break;
                                                                    default:
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                            title:
                                                                "تاكيد الطلب",
                                                            content: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    const TextUtils(
                                                                        text:
                                                                            "المبلغ المطلوب :",
                                                                        fontsize:
                                                                            20,
                                                                        fontweight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color:
                                                                            mainColor,
                                                                        underLine:
                                                                            TextDecoration.none),
                                                                    TextUtils(
                                                                        text: oTotalPrice
                                                                            .toString(),
                                                                        fontsize:
                                                                            20,
                                                                        fontweight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color:
                                                                            mainColor,
                                                                        underLine:
                                                                            TextDecoration.none)
                                                                  ],
                                                                ),
                                                                TextFormWdgt(
                                                                  controller:
                                                                      orderPhoneCtrl,
                                                                  lable: const Text(
                                                                      "رقم الجوال"),
                                                                  validator:
                                                                      (value) {
                                                                    if (value
                                                                        .toString()
                                                                        .isEmpty) {
                                                                      return "الحقل لايجب ان يكون فارغ";
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                ),
                                                                TextFormWdgt(
                                                                  controller:
                                                                      orderAddressCtrl,
                                                                  lable: const Text(
                                                                      "عنوان التوصيل"),
                                                                  validator:
                                                                      (value) {
                                                                    if (value
                                                                        .toString()
                                                                        .isEmpty) {
                                                                      return "الحقل لايجب ان يكون فارغ";
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                }
                                return const EmptyCart();
                              }),
                        ]),
                      )

                      //EmptyCart(),

                      ),
                ),
              )
            ])));
  }
}

//    Column(
//           children: [
//             Expanded(
//               flex: 6,
//               child: Column(

//                 children: [
//                   StreamBuilder(
//                       stream:
//                           FirebaseFirestore.instance.collection(cartID).snapshots(),
//                       //initialData: initialData,
//                       builder:
//                           (BuildContext context, AsyncSnapshot streamSnapshot) {
//                         if (streamSnapshot.hasData) {
//                           return !streamSnapshot.hasData
//                               ? const Center(child: CircularProgressIndicator())
//                               : ListView.builder(
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   //controller: scrollctrl,
//                                   itemCount: streamSnapshot.data!.docs.length,
//                                   itemBuilder: (context, index) {
//                                     final DocumentSnapshot foodSnapshot =
//                                         streamSnapshot.data!.docs[index];
//                                         // ordersList=foodSnapshot;
//                                     // var cartitems =
//                                     //     streamSnapshot.data!.docs.length.obs;

//                                     // streamSnapshot.data.docs.forEach((result) {
//                                     //   //fstoreCtrl.pTotal +=
//                                     //     pcount = result.data()[ffoodPrice];
//                                     // });

//                                     return Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: InkWell(
//                                             hoverColor: Colors.lightBlue[200],
//                                             onTap: () {},
//                                             child: Stack(
//                                               children: [
//                                                 CartItemCard(
//                                                     ffoodName: foodSnapshot[ffoodName],
//                                                     ffoodImg: foodSnapshot[ffoodImg],
//                                                     ffoodPrice: foodSnapshot[ffoodPrice]
//                                                     // removefrmCart: () {SnackBar(content: Text("data"));
//                                                     // fstoreCtrl.removeFoodFromCart(
//                                                     //     foodSnapshot,
//                                                     //     authctrl.cartid);

//                                                     // }
//                                                     ),
//                                                 Positioned(
//                                                     top: 15,
//                                                     left: 15,
//                                                     child: IconButton(
//                                                         onPressed: () {
//                                                           fstoreCtrl
//                                                               .removeFoodFromCart(
//                                                                   foodSnapshot,
//                                                                   authctrl.cartid);
//                                                         },
//                                                         icon: const Icon(
//                                                             Icons.close,
//                                                             size: 30,
//                                                             color: redClr)))
//                                               ],
//                                             )));
//                                   });
//                         }
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }),
//                       // Row(
//                       //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       //       children: [
//                       //         const Center(
//                       //           child: TextUtils(
//                       //               text: "Total",
//                       //               fontsize: 20,
//                       //               fontweight: FontWeight.normal,
//                       //               color: mainColor,
//                       //               underLine: TextDecoration.none),
//                       //         ),
//                       //        TextUtils(
//                       //               text: pcount.toString(),
//                       //               //fstoreCtrl.pTotal.toString(),
//                       //               fontsize: 20,
//                       //               fontweight: FontWeight.bold,
//                       //               color: Colors.black,
//                       //               underLine: TextDecoration.none)

//                       //       ],
//                       //     )
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Form(
//                           key: _formKey,
//                           child: SizedBox(
//                             child: Column(
//                               children: [
//                                 // TextFormWdgt(
//                                 //   controller: ordernameCtrl,
//                                 //   lable: const Text("ضاحب الطلب"),
//                                 //   validator: (value) {
//                                 //     if (value.toString().isEmpty) {
//                                 //       return "الحقل لايجب ان يكون فارغ";
//                                 //     } else {
//                                 //       return null;
//                                 //     }
//                                 //   },
//                                 // ),
//                                 TextFormWdgt(
//                                   controller: orderPhoneCtrl,
//                                   lable: const Text("رقم الجوال"),
//                                   validator: (value) {
//                                     if (value.toString().isEmpty) {
//                                       return "الحقل لايجب ان يكون فارغ";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 TextFormWdgt(
//                                   controller: orderAddressCtrl,
//                                   lable: const Text("عنوان التوصيل"),
//                                   validator: (value) {
//                                     if (value.toString().isEmpty) {
//                                       return "الحقل لايجب ان يكون فارغ";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ),
//                           )),
//                     ),
// StreamBuilder(
//                       stream:
//                           FirebaseFirestore.instance.collection(cartID).snapshots(),
//                       //initialData: initialData,
//                       builder:
//                           (BuildContext context, AsyncSnapshot streamSnapshot) {
//                         if (streamSnapshot.hasData) {

//                           //List<DocumentSnapshot> orderitems = [];
//                           List orderitems=[];
//                           // orderitems = streamSnapshot.data.docs;
//                           return !streamSnapshot.hasData
//                               ? const Center(child: CircularProgressIndicator())
//                               : ListView.builder(
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   //controller: scrollctrl,
//                                   itemCount:1,//streamSnapshot.data!.docs.length,
//                                   itemBuilder: (context, index) {
//                                     final DocumentSnapshot foodSnapshot =
//                                         streamSnapshot.data!.docs[index];
//                                         streamSnapshot.data.docs.forEach((result) {

//                                        // orderitems = result.data()[streamSnapshot.data!.docs[index]];
//                                     });

//                                     return SizedBox(
//                       height: 100,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: ButtonWdgt(text: "شراء", onPress: () {
//                                 fstoreCtrl.getfoods(foodSnapshot, cartID).then((value) => print(value)
//                                 //  fstoreCtrl.addOrder(CartModel(oPHone: orderPhoneCtrl.text,
//                                 //  oAddress: orderAddressCtrl.text, orderitems: value))
//                                  );

//                                 //  fstoreCtrl.addOrder(CartModel(oPHone: orderPhoneCtrl.text,
//                                 //  oAddress: orderAddressCtrl.text, orderitems: orderitems));

//                                 // fstoreCtrl.addOrder(
//                                 // CartModel(foodName: foodName, foodDetails: foodDetails, foodImageURL: foodImageURL,
//                                 // foodResturantID: foodResturantID, foodID: foodID,
//                                 // foodPrice: foodPrice, oPHone: orderPhoneCtrl.value.text, oAddress: orderAddressCtrl.value.text))

//                                 }),),
//                           ),
//                           // Column(
//                           //   mainAxisAlignment: MainAxisAlignment.center,
//                           //   children: [
//                           //     const Center(
//                           //       child: TextUtils(
//                           //           text: "Total",
//                           //           fontsize: 20,
//                           //           fontweight: FontWeight.normal,
//                           //           color: mainColor,
//                           //           underLine: TextDecoration.none),
//                           //     ),
//                           //    TextUtils(
//                           //           text: fstoreCtrl.pTotal.toString(),
//                           //           fontsize: 20,
//                           //           fontweight: FontWeight.bold,
//                           //           color: Colors.black,
//                           //           underLine: TextDecoration.none)

//                           //   ],
//                           // )
//                         ],
//                       ),
//                     );
//                                   });
//                         }
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }),
//                     //   SizedBox(
//                     //   height: 100,
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     //     children: [
//                     //       Expanded(
//                     //         child: Padding(
//                     //           padding: const EdgeInsets.all(5.0),
//                     //           child: ButtonWdgt(text: "شراء", onPress: () {
//                     //             // print(ordersList.toString());

//                     //             // fstoreCtrl.addOrder(
//                     //             // CartModel(foodName: foodName, foodDetails: foodDetails, foodImageURL: foodImageURL,
//                     //             // foodResturantID: foodResturantID, foodID: foodID,
//                     //             // foodPrice: foodPrice, oPHone: orderPhoneCtrl.value.text, oAddress: orderAddressCtrl.value.text))

//                     //             }),),
//                     //       ),
//                     //       // Column(
//                     //       //   mainAxisAlignment: MainAxisAlignment.center,
//                     //       //   children: [
//                     //       //     const Center(
//                     //       //       child: TextUtils(
//                     //       //           text: "Total",
//                     //       //           fontsize: 20,
//                     //       //           fontweight: FontWeight.normal,
//                     //       //           color: mainColor,
//                     //       //           underLine: TextDecoration.none),
//                     //       //     ),
//                     //       //    TextUtils(
//                     //       //           text: fstoreCtrl.pTotal.toString(),
//                     //       //           fontsize: 20,
//                     //       //           fontweight: FontWeight.bold,
//                     //       //           color: Colors.black,
//                     //       //           underLine: TextDecoration.none)

//                     //       //   ],
//                     //       // )
//                     //     ],
//                     //   ),
//                     // ),

//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
