import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/cart_model.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/admin/text_form_wdgt.dart';
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
  static bool isDone = false;

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
  final orderNameCtrl = TextEditingController();

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
    int itemcount = 0;
    double loadingH = MediaQuery.of(context).size.height;
    double loadingW = MediaQuery.of(context).size.width;
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
                          return (itemcount == 0)
                              ? const Center(child: EmptyCart())
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  controller: scrollCtrl2,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot foodSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    fstoreCtrl.deleteDOC = foodSnapshot;
                                    // itemscount=streamSnapshot.data!.docs.length;
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
                      // autovalidateMode: AutovalidateMode.always,
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
                                  itemcount = 0;
                                  if (streamSnapshot.data!.docs.length >= 1) {
                                    itemcount = 1;
                                  }
                                  return !streamSnapshot.hasData
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          //controller: scrollctrl,
                                          itemCount: itemcount,
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
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  backgroundColor:
                                                                      lightGreyclr,
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  scrollable:
                                                                      true,
                                                                  title:
                                                                      const Center(
                                                                    child: Text(
                                                                        "تاكيد الطلب"),
                                                                  ),
                                                                  content:
                                                                      Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          const TextUtils(
                                                                              text: "المبلغ المطلوب :",
                                                                              fontsize: 20,
                                                                              fontweight: FontWeight.bold,
                                                                              color: mainColor,
                                                                              underLine: TextDecoration.none),
                                                                          TextUtils(
                                                                              text: oTotalPrice.toString(),
                                                                              fontsize: 20,
                                                                              fontweight: FontWeight.bold,
                                                                              color: mainColor,
                                                                              underLine: TextDecoration.none)
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
                                                                            orderNameCtrl,
                                                                        lable: const Text(
                                                                            "اسم صاحب الطلب"),
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
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              orderAddressCtrl.clear();
                                                                              orderPhoneCtrl.clear();
                                                                              orderNameCtrl.clear();
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Text("تراجع"),
                                                                          ),
                                                                          ElevatedButton(
                                                                            onPressed:
                                                                                () async {
                                                                              if (_formKey.currentState!.validate()) {
                                                                                _formKey.currentState!.save();
                                                                                // Future.delayed(const Duration(seconds: 5), () {
                                                                                //   isDone = true;
                                                                                // });
                                                                             //   print("pefore if");
                                                                                // if (isDone == false) {
                                                                                //   showToastWidget(
                                                                                //     Container(
                                                                                //         color: Colors.black.withOpacity(0.8),
                                                                                //         height: loadingH,
                                                                                //         width: loadingW,
                                                                                //         child: LoadingAnimationWidget.dotsTriangle(
                                                                                //           color: Colors.white,
                                                                                //           size: 70,
                                                                                //         )),
                                                                                //     position: ToastPosition.center,
                                                                                //     duration: const Duration(seconds: 10),
                                                                                //     // onDismiss: () {
                                                                                //     //   //   print("if true ");
                                                                                //     // },
                                                                                //   );
                                                                                // }
                                                                               // print("before switch");

                                                                                switch (itemsLenght) {
                                                                                  case 1:
                                                                                  Navigator.pop(context);
                                                                                  showToastWidget(
                                                                                    Container(
                                                                                        color: Colors.black.withOpacity(0.8),
                                                                                        height: loadingH,
                                                                                        width: loadingW,
                                                                                        child: LoadingAnimationWidget.dotsTriangle(
                                                                                          color: Colors.white,
                                                                                          size: 70,
                                                                                        )),
                                                                                    position: ToastPosition.center,
                                                                                    duration: const Duration(seconds: 10),
                                                                                    // onDismiss: () {
                                                                                    //   //   print("if true ");
                                                                                    // },
                                                                                  );
                                                                                    await fstoreCtrl
                                                                                        .addOrder(CartModel(
                                                                                      foodResturantId: ridCtrl.text,
                                                                                      oTotalPrice: oTotalPrice,
                                                                                      oName: orderNameCtrl.text,
                                                                                      foodResturantName: rNameCtrl.text,
                                                                                      oPHone: int.tryParse(orderPhoneCtrl.text),
                                                                                      oAddress: orderAddressCtrl.text,
                                                                                      cartItems: [
                                                                                        {
                                                                                          ffoodName: nCtrl.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl.text),
                                                                                        }
                                                                                      ],
                                                                                    ))
                                                                                        .whenComplete(() {
                                                                                      isDone = true;
                                                                                    });
                                                                                    clearCtrl();

                                                                                    await fstoreCtrl.deleteAllColl(fstoreCtrl.deleteDOC, cartID);

                                                                                    break;
                                                                                  case 2:Navigator.pop(context);
                                                                                  showToastWidget(
                                                                                    Container(
                                                                                        color: Colors.black.withOpacity(0.8),
                                                                                        height: loadingH,
                                                                                        width: loadingW,
                                                                                        child: LoadingAnimationWidget.dotsTriangle(
                                                                                          color: Colors.white,
                                                                                          size: 70,
                                                                                        )),
                                                                                    position: ToastPosition.center,
                                                                                    duration: const Duration(seconds: 10),
                                                                                    // onDismiss: () {
                                                                                    //   //   print("if true ");
                                                                                    // },
                                                                                  );
                                                                                    await fstoreCtrl
                                                                                        .addOrder(CartModel(
                                                                                      foodResturantId: ridCtrl.text,
                                                                                      foodResturantName: rNameCtrl.text,
                                                                                      oTotalPrice: oTotalPrice,
                                                                                      oName: orderNameCtrl.text,
                                                                                      oPHone: int.tryParse(orderPhoneCtrl.text),
                                                                                      oAddress: orderAddressCtrl.text,
                                                                                      cartItems: [
                                                                                        {
                                                                                          ffoodName: nCtrl.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl1.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl1.text),
                                                                                        },
                                                                                        // {
                                                                                        //   ffoodName:
                                                                                        //       nCtrl1.text
                                                                                        // }
                                                                                      ],
                                                                                    ))
                                                                                        .whenComplete(() {
                                                                                      isDone = true;
                                                                                    });
                                                                                    clearCtrl();

                                                                                    await fstoreCtrl.deleteAllColl(fstoreCtrl.deleteDOC, cartID);
                                                                                    //Get.snackbar("تنبية", "تم ارسال الطلب", snackPosition: SnackPosition.BOTTOM);

                                                                                    break;
                                                                                  case 3:
                                                                                  Navigator.pop(context);
                                                                                  showToastWidget(
                                                                                    Container(
                                                                                        color: Colors.black.withOpacity(0.8),
                                                                                        height: loadingH,
                                                                                        width: loadingW,
                                                                                        child: LoadingAnimationWidget.dotsTriangle(
                                                                                          color: Colors.white,
                                                                                          size: 70,
                                                                                        )),
                                                                                    position: ToastPosition.center,
                                                                                    duration: const Duration(seconds: 10),
                                                                                    // onDismiss: () {
                                                                                    //   //   print("if true ");
                                                                                    // },
                                                                                  );
                                                                                    await fstoreCtrl
                                                                                        .addOrder(CartModel(
                                                                                      foodResturantId: ridCtrl.text,
                                                                                      foodResturantName: rNameCtrl.text,
                                                                                      oTotalPrice: oTotalPrice,
                                                                                      oName: orderNameCtrl.text,
                                                                                      oPHone: int.tryParse(orderPhoneCtrl.text),
                                                                                      oAddress: orderAddressCtrl.text,
                                                                                      cartItems: [
                                                                                        {
                                                                                          ffoodName: nCtrl.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl1.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl1.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl2.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl2.text),
                                                                                        },
                                                                                        // {
                                                                                        //   ffoodName:
                                                                                        //       nCtrl2.text
                                                                                        // }
                                                                                      ],
                                                                                    ))
                                                                                        .whenComplete(() {
                                                                                      isDone = true;
                                                                                    });
                                                                                    clearCtrl();

                                                                                    await fstoreCtrl.deleteAllColl(fstoreCtrl.deleteDOC, cartID);
                                                                                    // Get.snackbar("تنبية", "تم ارسال الطلب", snackPosition: SnackPosition.BOTTOM);
                                                                                    break;
                                                                                  case 4:
                                                                                  Navigator.pop(context);
                                                                                  showToastWidget(
                                                                                    Container(
                                                                                        color: Colors.black.withOpacity(0.8),
                                                                                        height: loadingH,
                                                                                        width: loadingW,
                                                                                        child: LoadingAnimationWidget.dotsTriangle(
                                                                                          color: Colors.white,
                                                                                          size: 70,
                                                                                        )),
                                                                                    position: ToastPosition.center,
                                                                                    duration: const Duration(seconds: 10),
                                                                                    // onDismiss: () {
                                                                                    //   //   print("if true ");
                                                                                    // },
                                                                                  );
                                                                                    await fstoreCtrl
                                                                                        .addOrder(CartModel(
                                                                                      foodResturantId: ridCtrl.text,
                                                                                      foodResturantName: rNameCtrl.text,
                                                                                      oTotalPrice: oTotalPrice,
                                                                                      oName: orderNameCtrl.text,
                                                                                      oPHone: int.tryParse(orderPhoneCtrl.text),
                                                                                      oAddress: orderAddressCtrl.text,
                                                                                      cartItems: [
                                                                                        {
                                                                                          ffoodName: nCtrl.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl1.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl1.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl2.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl2.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl3.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl3.text),
                                                                                        },
                                                                                        // {
                                                                                        //   ffoodName:
                                                                                        //       nCtrl4.text
                                                                                        //       ,ffoodPrice:int.tryParse(pCtrl4.text),
                                                                                        // }
                                                                                      ],
                                                                                    ))
                                                                                        .whenComplete(() {
                                                                                      isDone = true;
                                                                                    });
                                                                                    clearCtrl();

                                                                                    await fstoreCtrl.deleteAllColl(fstoreCtrl.deleteDOC, cartID);
                                                                                    // Get.snackbar("تنبية", "تم ارسال الطلب", snackPosition: SnackPosition.BOTTOM);

                                                                                    break;
                                                                                  case 5:
                                                                                  Navigator.pop(context);
                                                                                  showToastWidget(
                                                                                    Container(
                                                                                        color: Colors.black.withOpacity(0.8),
                                                                                        height: loadingH,
                                                                                        width: loadingW,
                                                                                        child: LoadingAnimationWidget.dotsTriangle(
                                                                                          color: Colors.white,
                                                                                          size: 70,
                                                                                        )),
                                                                                    position: ToastPosition.center,
                                                                                    duration: const Duration(seconds: 10),
                                                                                    // onDismiss: () {
                                                                                    //   //   print("if true ");
                                                                                    // },
                                                                                  );
                                                                                    await fstoreCtrl
                                                                                        .addOrder(CartModel(
                                                                                      foodResturantId: ridCtrl.text,
                                                                                      foodResturantName: rNameCtrl.text,
                                                                                      oTotalPrice: oTotalPrice,
                                                                                      oName: orderNameCtrl.text,
                                                                                      oPHone: int.tryParse(orderPhoneCtrl.text),
                                                                                      oAddress: orderAddressCtrl.text,
                                                                                      cartItems: [
                                                                                        {
                                                                                          ffoodName: nCtrl.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl1.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl1.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl2.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl2.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl3.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl3.text),
                                                                                        },
                                                                                        {
                                                                                          ffoodName: nCtrl4.text,
                                                                                          ffoodPrice: int.tryParse(pCtrl4.text),
                                                                                        },
                                                                                        // {
                                                                                        //   ffoodName:
                                                                                        //       nCtrl4.text
                                                                                        // }
                                                                                      ],
                                                                                    ))
                                                                                        .whenComplete(() {
                                                                                      isDone = true;
                                                                                    });
                                                                                    clearCtrl();

                                                                                    await fstoreCtrl.deleteAllColl(fstoreCtrl.deleteDOC, cartID);
                                                                                    // Get.snackbar("تنبية", "تم ارسال الطلب", snackPosition: SnackPosition.BOTTOM);
                                                                                    break;
                                                                                  default:
                                                                                }
                                                                               // print("after switch");
                                                                                // ignore: use_build_context_synchronously
                                                                                

                                                                                if (isDone == true) {
                                                                                  dismissAllToast();
                                                                                  Get.snackbar("تنبية", "تم ارسال الطلب", snackPosition: SnackPosition.BOTTOM);
                                                                                 // print("dissmess");
                                                                                }
                                                                              }

                                                                              orderAddressCtrl.clear();
                                                                              orderPhoneCtrl.clear();
                                                                              orderNameCtrl.clear();
                                                                              // ignore: use_build_context_synchronously
                                                                            },
                                                                            child:
                                                                                const Text("تاكيد"),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // actions: [

                                                                  // ],
                                                                );
                                                              });
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
