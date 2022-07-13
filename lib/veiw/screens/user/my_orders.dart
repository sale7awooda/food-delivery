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

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);
  //final fstoreCtrl = Get.find<FirestoreController>();
  //final cartctrl = Get.find<CartController>();
  final authctrl = Get.find<AuthController>();
  final fstoreCtrl = Get.find<FirestoreController>();
  final _formKey = GlobalKey<FormState>();

  final String ffoodName = 'foodName';
  final String ffoodDetails = 'foodDetails';
  final String ffoodImg = 'foodImgUrl';
  final String ffoodResturantID = 'foodResturantID';
  final String ffoodPrice = 'foodPrice';
  static String ffoPhone = 'oPhone';
  static String ffoAddress = 'oAddress';
  static String ffoItems = 'oItems';
  static String ffoodID = 'foodID';
  //final ordernameCtrl = TextEditingController();
  final orderPhoneCtrl = TextEditingController();
  final orderAddressCtrl = TextEditingController();

  final idCtrl = TextEditingController();
  final nCtrl = TextEditingController();
  final dCtrl = TextEditingController();
  final imgCtrl = TextEditingController();
  final pCtrl = TextEditingController();
  final ridCtrl = TextEditingController();
  final idCtrl1 = TextEditingController();
  final nCtrl1 = TextEditingController();
  final dCtrl1 = TextEditingController();
  final imgCtrl1 = TextEditingController();
  final pCtrl1 = TextEditingController();
  final ridCtrl1 = TextEditingController();
  final idCtrl2 = TextEditingController();
  final nCtrl2 = TextEditingController();
  final dCtrl2 = TextEditingController();
  final imgCtrl2 = TextEditingController();
  final pCtrl2 = TextEditingController();
  final ridCtrl2 = TextEditingController();
  final idCtrl3 = TextEditingController();
  final nCtrl3 = TextEditingController();
  final dCtrl3 = TextEditingController();
  final imgCtrl3 = TextEditingController();
  final pCtrl3 = TextEditingController();
  final ridCtrl3 = TextEditingController();
  final idCtrl4 = TextEditingController();
  final nCtrl4 = TextEditingController();
  final dCtrl4 = TextEditingController();
  final imgCtrl4 = TextEditingController();
  final pCtrl4 = TextEditingController();
  final ridCtrl4 = TextEditingController();
  final idCtrl5 = TextEditingController();
  final nCtrl5 = TextEditingController();
  final dCtrl5 = TextEditingController();
  final imgCtrl5 = TextEditingController();
  final pCtrl5 = TextEditingController();
  final ridCtrl5 = TextEditingController();
  clearCtrl() {
    idCtrl.clear();
    idCtrl1.clear();
    idCtrl1.clear();
    idCtrl3.clear();
    idCtrl4.clear();
    idCtrl5.clear();
    nCtrl.clear();
    nCtrl1.clear();
    nCtrl2.clear();
    nCtrl3.clear();
    nCtrl4.clear();
    nCtrl5.clear();
    dCtrl.clear();
    dCtrl1.clear();
    dCtrl2.clear();
    dCtrl3.clear();
    dCtrl4.clear();
    dCtrl5.clear();
    pCtrl.clear();
    pCtrl1.clear();
    pCtrl2.clear();
    pCtrl3.clear();
    pCtrl4.clear();
    pCtrl5.clear();
    imgCtrl.clear();
    imgCtrl1.clear();
    imgCtrl2.clear();
    imgCtrl3.clear();
    imgCtrl4.clear();
    imgCtrl5.clear();
    ridCtrl.clear();
    ridCtrl1.clear();
    ridCtrl2.clear();
    ridCtrl3.clear();
    ridCtrl4.clear();
    ridCtrl5.clear();
  }

  @override
  Widget build(BuildContext context) {
    var cartID = authctrl.cartid;
    // int pcount=0;
    // DocumentSnapshot<Object?>? ordersList;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  StreamBuilder(
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
                                  //controller: scrollctrl,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot foodSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    int selector =
                                        streamSnapshot.data!.docs.length;
                                    switch (index) {
                                      case 0:
                                        {
                                          idCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          dCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodDetails];
                                          imgCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodImg];
                                          pCtrl.text = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice])
                                              .toString();
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                        }
                                        break;
                                      case 1:
                                        {
                                          idCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          dCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodDetails];
                                          imgCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodImg];
                                          pCtrl.text = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice])
                                              .toString();
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          idCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodID];
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          dCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodDetails];
                                          imgCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodImg];
                                          pCtrl1.text = (streamSnapshot
                                                  .data!.docs[1][ffoodPrice])
                                              .toString();
                                          ridCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodResturantID];
                                        }
                                        break;
                                      case 2:
                                        {
                                          idCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          dCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodDetails];
                                          imgCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodImg];
                                          pCtrl.text = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice])
                                              .toString();
                                          ridCtrl.text =
                                              foodSnapshot[ffoodResturantID];
                                          idCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodID];
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          dCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodDetails];
                                          imgCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodImg];
                                          pCtrl1.text = (streamSnapshot
                                                  .data!.docs[1][ffoodPrice])
                                              .toString();
                                          ridCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodResturantID];
                                          idCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodID];
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          dCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodDetails];
                                          imgCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodImg];
                                          pCtrl2.text = (streamSnapshot
                                                  .data!.docs[2][ffoodPrice])
                                              .toString();
                                          ridCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodResturantID];
                                        }
                                        break;
                                      case 3:
                                        {
                                          idCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          dCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodDetails];
                                          imgCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodImg];
                                          pCtrl.text = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice])
                                              .toString();
                                          ridCtrl.text =
                                              foodSnapshot[ffoodResturantID];
                                          idCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodID];
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          dCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodDetails];
                                          imgCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodImg];
                                          pCtrl1.text = (streamSnapshot
                                                  .data!.docs[1][ffoodPrice])
                                              .toString();
                                          ridCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodResturantID];
                                          idCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodID];
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          dCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodDetails];
                                          imgCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodImg];
                                          pCtrl2.text = (streamSnapshot
                                                  .data!.docs[2][ffoodPrice])
                                              .toString();
                                          ridCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodResturantID];
                                          idCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodID];
                                          nCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodName];
                                          dCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodDetails];
                                          imgCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodImg];
                                          pCtrl3.text = (streamSnapshot
                                                  .data!.docs[3][ffoodPrice])
                                              .toString();
                                          ridCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodResturantID];
                                        }
                                        break;
                                      case 4:
                                        {
                                          idCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          dCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodDetails];
                                          imgCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodImg];
                                          pCtrl.text = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice])
                                              .toString();
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          idCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodID];
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          dCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodDetails];
                                          imgCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodImg];
                                          pCtrl1.text = (streamSnapshot
                                                  .data!.docs[1][ffoodPrice])
                                              .toString();
                                          ridCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodResturantID];
                                          idCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodID];
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          dCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodDetails];
                                          imgCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodImg];
                                          pCtrl2.text = (streamSnapshot
                                                  .data!.docs[2][ffoodPrice])
                                              .toString();
                                          ridCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodResturantID];
                                          idCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodID];
                                          nCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodName];
                                          dCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodDetails];
                                          imgCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodImg];
                                          pCtrl3.text = (streamSnapshot
                                                  .data!.docs[3][ffoodPrice])
                                              .toString();
                                          ridCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodResturantID];
                                          idCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodID];
                                          nCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodName];
                                          dCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodDetails];
                                          imgCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodImg];
                                          pCtrl4.text = (streamSnapshot
                                                  .data!.docs[4][ffoodPrice])
                                              .toString();
                                          ridCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodResturantID];
                                        }
                                        break;
                                      case 5:
                                        {
                                          idCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodID];
                                          nCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodName];
                                          dCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodDetails];
                                          imgCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodImg];
                                          pCtrl.text = (streamSnapshot
                                                  .data!.docs[0][ffoodPrice])
                                              .toString();
                                          ridCtrl.text = streamSnapshot
                                              .data!.docs[0][ffoodResturantID];
                                          idCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodID];
                                          nCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodName];
                                          dCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodDetails];
                                          imgCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodImg];
                                          pCtrl1.text = (streamSnapshot
                                                  .data!.docs[1][ffoodPrice])
                                              .toString();
                                          ridCtrl1.text = streamSnapshot
                                              .data!.docs[1][ffoodResturantID];
                                          idCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodID];
                                          nCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodName];
                                          dCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodDetails];
                                          imgCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodImg];
                                          pCtrl2.text = (streamSnapshot
                                                  .data!.docs[2][ffoodPrice])
                                              .toString();
                                          ridCtrl2.text = streamSnapshot
                                              .data!.docs[2][ffoodResturantID];
                                          idCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodID];
                                          nCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodName];
                                          dCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodDetails];
                                          imgCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodImg];
                                          pCtrl3.text = (streamSnapshot
                                                  .data!.docs[3][ffoodPrice])
                                              .toString();
                                          ridCtrl3.text = streamSnapshot
                                              .data!.docs[3][ffoodResturantID];
                                          idCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodID];
                                          nCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodName];
                                          dCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodDetails];
                                          imgCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodImg];
                                          pCtrl4.text = (streamSnapshot
                                                  .data!.docs[4][ffoodPrice])
                                              .toString();
                                          ridCtrl4.text = streamSnapshot
                                              .data!.docs[4][ffoodResturantID];
                                          idCtrl5.text = streamSnapshot
                                              .data!.docs[5][ffoodID];
                                          nCtrl5.text = streamSnapshot
                                              .data!.docs[5][ffoodName];
                                          dCtrl5.text = streamSnapshot
                                              .data!.docs[5][ffoodDetails];
                                          imgCtrl5.text = streamSnapshot
                                              .data!.docs[5][ffoodImg];
                                          pCtrl5.text = (streamSnapshot
                                                  .data!.docs[5][ffoodPrice])
                                              .toString();
                                          ridCtrl5.text = streamSnapshot
                                              .data!.docs[5][ffoodResturantID];
                                        }
                                        break;

                                      default:
                                    }

                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 40),
                                        child: InkWell(
                                            hoverColor: Colors.lightBlue[200],
                                            onTap: () {},
                                            child: Stack(
                                              children: [
                                                CartItemCard(
                                                    ffoodName:
                                                        foodSnapshot[ffoodName],
                                                    ffoodImg:
                                                        foodSnapshot[ffoodImg],
                                                    ffoodPrice: foodSnapshot[
                                                        ffoodPrice]),
                                                Positioned(
                                                    top: 15,
                                                    left: 15,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          fstoreCtrl
                                                              .removeFoodFromCart(
                                                                  foodSnapshot,
                                                                  authctrl
                                                                      .cartid);
                                                        },
                                                        icon: const Icon(
                                                            Icons.close,
                                                            size: 30,
                                                            color: redClr)))
                                              ],
                                            )));
                                  });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  Column(children: [
                    Padding(
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
                                      //List<DocumentSnapshot> orderitems = [];
                                      //List orderitems = [];
                                      // orderitems = streamSnapshot.data.docs;
                                      int itemCount = 0;
                                      if (streamSnapshot.data!.docs.length >
                                          1) {
                                        itemCount = 1;
                                      }
                                      return !streamSnapshot.hasData
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              //controller: scrollctrl,
                                              itemCount: itemCount,
                                              itemBuilder: (context, index) {
                                                // final DocumentSnapshot
                                                // foodSnapshot =
                                                // streamSnapshot
                                                //     .data!.docs[index];

                                                return SizedBox(
                                                  height: 100,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: ButtonWdgt(
                                                              text: "طلب",
                                                              onPress: () {
                                                                Get.defaultDialog(
                                                                  cancel:
                                                                      ButtonWdgt(
                                                                    text:
                                                                        "تراجع",
                                                                    onPress:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  titleStyle: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  confirm:
                                                                      ButtonWdgt(
                                                                    text:
                                                                        "تاكيد",
                                                                    onPress:
                                                                        () {
                                                                      fstoreCtrl.addOrder(CartModel(
                                                                        foodResturantId: ridCtrl.text,
                                                                          oPHone: int.tryParse(orderPhoneCtrl
                                                                              .text),
                                                                          oAddress:
                                                                              orderAddressCtrl.text,
                                                                          cartItems: [
                                                                            {
                                                                              ffoodName: nCtrl.text,
                                                                              ffoodDetails: dCtrl.text,
                                                                              ffoodImg: imgCtrl.text,
                                                                              ffoodResturantID: ridCtrl.text,
                                                                              ffoodPrice: pCtrl.text,
                                                                              ffoodID: idCtrl.text,
                                                                            },
                                                                            {
                                                                              // ffoodName: nCtrl1.text,
                                                                              // ffoodDetails: dCtrl1.text,
                                                                              // ffoodImg: imgCtrl1.text,
                                                                              // ffoodResturantID: ridCtrl1.text,
                                                                              // ffoodPrice: pCtrl1.text,
                                                                              // ffoodID: idCtrl1.text,
                                                                            },
                                                                            {
                                                                              ffoodName: nCtrl2.text,
                                                                              ffoodDetails: dCtrl2.text,
                                                                              ffoodImg: imgCtrl2.text,
                                                                              ffoodResturantID: ridCtrl2.text,
                                                                              ffoodPrice: pCtrl2.text,
                                                                              ffoodID: idCtrl1.text,
                                                                            },
                                                                            {
                                                                              ffoodName: nCtrl3.text,
                                                                              ffoodDetails: dCtrl3.text,
                                                                              ffoodImg: imgCtrl3.text,
                                                                              ffoodResturantID: ridCtrl3.text,
                                                                              ffoodPrice: pCtrl3.text,
                                                                              ffoodID: idCtrl3.text,
                                                                            },
                                                                            {
                                                                              ffoodName: nCtrl4.text,
                                                                              ffoodDetails: dCtrl4.text,
                                                                              ffoodImg: imgCtrl4.text,
                                                                              ffoodResturantID: ridCtrl4.text,
                                                                              ffoodPrice: pCtrl4.text,
                                                                              ffoodID: idCtrl4.text,
                                                                            },
                                                                            {
                                                                              ffoodName: nCtrl5.text,
                                                                              ffoodDetails: dCtrl5.text,
                                                                              ffoodImg: imgCtrl5.text,
                                                                              ffoodResturantID: ridCtrl5.text,
                                                                              ffoodPrice: pCtrl5.text,
                                                                              ffoodID: idCtrl5.text,
                                                                            },
                                                                          ]));
                                                                      clearCtrl();
                                                                    },
                                                                  ),
                                                                  title:
                                                                      "تاكيد الطلب",
                                                                  content:
                                                                      Column(
                                                                    children: [
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
                                                  ),
                                                );
                                              });
                                    }
                                    return const EmptyCart();
                                  }),
                            ]),
                          )

                          //EmptyCart(),

                          ),
                    )
                  ])
                ]))));
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
