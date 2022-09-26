import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/cart_model.dart';
import 'package:orders/utils/theme.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class RestOrdersScreen extends StatefulWidget {
  const RestOrdersScreen({Key? key}) : super(key: key);

  static String ffoPhone = 'oPhone';
  static String ffoAddress = 'oAddress';
  static String ffoItems = 'oItems';
  static String ffoodID = 'foodID';

  @override
  State<RestOrdersScreen> createState() => _RestOrdersScreenState();
}

class _RestOrdersScreenState extends State<RestOrdersScreen> {
  // final authctrl = Get.find<AuthController>();
  final fstoreCtrl = Get.find<FirestoreController>();

  //final _formKey = GlobalKey<FormState>();

  final String ffoodName = 'foodName';

  final String ffoodDetails = 'foodDetails';

  final String ffoodImg = 'foodImgUrl';

  final String ffoodResturantID = 'foodResturantID';

  final String ffoodPrice = 'foodPrice';

  //final ordernameCtrl = TextEditingController();
  final orderPhoneCtrl = TextEditingController();

  final orderAddressCtrl = TextEditingController();

  // String? item1 = "item";

  // String? item2 = "item";

  // String? item3 = "item";

  // String? item4 = "item";

  // String? item5 = "item";
  final item1 = TextEditingController();

  final item2 = TextEditingController();

  final item3 = TextEditingController();

  final item4 = TextEditingController();

  final item5 = TextEditingController();

  bool v1 = false;

  bool v2 = false;

  bool v3 = false;

  bool v4 = false;

  bool v5 = false;

  final idCtrl = TextEditingController();

  final nCtrl = TextEditingController();

  final nCtrl1 = TextEditingController();

  final nCtrl2 = TextEditingController();

  final nCtrl3 = TextEditingController();

  final nCtrl4 = TextEditingController();

  final nCtrl5 = TextEditingController();

  clearCtrl() {
    idCtrl.clear();

    nCtrl.clear();
    nCtrl1.clear();
    nCtrl2.clear();
    nCtrl3.clear();
    nCtrl4.clear();
    nCtrl5.clear();
  }

  clearTxtCtrl() {
    item1.clear();
    item2.clear();
    item3.clear();
    item4.clear();
    item5.clear();
  }

  @override
  Widget build(BuildContext context) {
    //var cartID = authctrl.cartid;
    // int pcount=0;
    // DocumentSnapshot<Object?>? ordersList;
    List<dynamic> items = [];
    // ignore: prefer_typing_uninitialized_variables
    //var docID;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .where('foodResturantID', isEqualTo: fstoreCtrl.restID)
                .snapshots(),
            //initialData: initialData,
            builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
              if (streamSnapshot.hasData) {
                return !streamSnapshot.hasData
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        //controller: scrollctrl,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot ordersSnapshot =
                              streamSnapshot.data!.docs[index];
                          // docID = ordersSnapshot;
                          // int selector =
                          //     streamSnapshot.data!.docs.length;
                          // items = List.from(ordersSnapshot['oItems']);
                          // fstoreCtrl.ordersCount.value = items.length;
                          // switch (items.length) {
                          //   case 1:
                          //     item1.text = items[0]["foodName"];
                          //     v1 = true;
                          //     break;
                          //   case 2:
                          //     item1.text = items[0]["foodName"];
                          //     item2.text = items[1]["foodName"];
                          //     v1 = true;
                          //     v2 = true;
                          //     break;
                          //   case 3:
                          //     v1 = true;
                          //     v2 = true;
                          //     v3 = true;
                          //     item1.text = items[0]["foodName"];
                          //     item2.text = items[1]["foodName"];
                          //     item3.text = items[2]["foodName"];
                          //     break;
                          //   case 4:
                          //     v1 = true;
                          //     v2 = true;
                          //     v3 = true;
                          //     v4 = true;
                          //     item1.text = items[0]["foodName"];
                          //     item2.text = items[1]["foodName"];
                          //     item3.text = items[2]["foodName"];
                          //     item4.text = items[3]["foodName"];
                          //     break;
                          //   case 5:
                          //     v1 = true;
                          //     v2 = true;
                          //     v3 = true;
                          //     v4 = true;
                          //     v5 = true;
                          //     item1.text = items[0]["foodName"];
                          //     item2.text = items[1]["foodName"];
                          //     item3.text = items[2]["foodName"];
                          //     item4.text = items[3]["foodName"];
                          //     item5.text = items[4]["foodName"];
                          //     break;
                          //   default:
                          // }

                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: InkWell(
                                  hoverColor: Colors.lightBlue[200],
                                  onTap: () {
                                    items = List.from(ordersSnapshot['oItems']);
                                    fstoreCtrl.ordersCount.value = items.length;
                                    setState(() {
                                      //clearTxtCtrl();
                                      //print(ordersSnapshot);
                                      switch (items.length) {
                                        case 1:
                                          item1.text = items[0]["foodName"];
                                          v1 = true;
                                          v2 = false;
                                          v3 = false;
                                          v4 = false;
                                          v5 = false;

                                          break;
                                        case 2:
                                          item1.text = items[0]["foodName"];
                                          item2.text = items[1]["foodName"];
                                          v1 = true;
                                          v2 = true;
                                          v3 = false;
                                          v4 = false;
                                          v5 = false;

                                          break;
                                        case 3:
                                          item1.text = items[0]["foodName"];
                                          item2.text = items[1]["foodName"];
                                          item3.text = items[2]["foodName"];
                                          v1 = true;
                                          v2 = true;
                                          v3 = true;
                                          v4 = false;
                                          v5 = false;

                                          break;
                                        case 4:
                                          item1.text = items[0]["foodName"];
                                          item2.text = items[1]["foodName"];
                                          item3.text = items[2]["foodName"];
                                          item4.text = items[3]["foodName"];
                                          v1 = true;
                                          v2 = true;
                                          v3 = true;
                                          v4 = true;
                                          v5 = false;
                                          break;
                                        case 5:
                                          item1.text = items[0]["foodName"];
                                          item2.text = items[1]["foodName"];
                                          item3.text = items[2]["foodName"];
                                          item4.text = items[3]["foodName"];
                                          item5.text = items[4]["foodName"];
                                          v1 = true;
                                          v2 = true;
                                          v3 = true;
                                          v4 = true;
                                          v5 = true;

                                          break;
                                        default:
                                      }
                                    });

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: lightGreyclr,
                                            contentPadding:
                                                const EdgeInsets.all(5),
                                            scrollable: true,
                                            title: const Center(
                                              child: TextUtils(
                                                  text: "تفاصيل الطلب ",
                                                  fontsize: 30,
                                                  fontweight: FontWeight.bold,
                                                  color: Colors.black,
                                                  underLine:
                                                      TextDecoration.none),
                                            ), // To display the title it is optional
                                            content: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 40),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Visibility(
                                                      visible: v1,
                                                      child: TextUtils(
                                                          text: item1.text,
                                                          fontsize: 20,
                                                          fontweight:
                                                              FontWeight.bold,
                                                          color: mainColor,
                                                          underLine:
                                                              TextDecoration
                                                                  .none)),
                                                  Visibility(
                                                    visible: v2,
                                                    child: TextUtils(
                                                        text: item2.text,
                                                        fontsize: 20,
                                                        fontweight:
                                                            FontWeight.bold,
                                                        color: mainColor,
                                                        underLine:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  Visibility(
                                                      visible: v3,
                                                      child: TextUtils(
                                                          text: item3.text,
                                                          fontsize: 20,
                                                          fontweight:
                                                              FontWeight.bold,
                                                          color: mainColor,
                                                          underLine:
                                                              TextDecoration
                                                                  .none)),
                                                  Visibility(
                                                      visible: v4,
                                                      child: TextUtils(
                                                          text: item4.text,
                                                          fontsize: 20,
                                                          fontweight:
                                                              FontWeight.bold,
                                                          color: mainColor,
                                                          underLine:
                                                              TextDecoration
                                                                  .none)),
                                                  Visibility(
                                                      visible: v5,
                                                      child: TextUtils(
                                                          text: item5.text,
                                                          fontsize: 20,
                                                          fontweight:
                                                              FontWeight.bold,
                                                          color: mainColor,
                                                          underLine:
                                                              TextDecoration
                                                                  .none)),
                                                ],
                                              ),
                                            ), // Message which will be pop up on the screen

                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      fstoreCtrl.updateOrder(
                                                          ordersSnapshot,
                                                          CartModel(
                                                              ostatus:
                                                                  'false'));
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('رفض'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      fstoreCtrl.updateOrder(
                                                          ordersSnapshot,
                                                          CartModel(
                                                              ostatus: 'true'));
                                                      clearTxtCtrl();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('قبول'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Stack(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        elevation: 10,
                                        shadowColor: Colors.black38,
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.all(25),
                                          title: TextUtils(
                                              text:
                                                  "0${ordersSnapshot['oPhone']}",
                                              fontsize: 20,
                                              fontweight: FontWeight.normal,
                                              color: mainColor,
                                              underLine: TextDecoration.none),
                                          subtitle: TextUtils(
                                              text: ordersSnapshot['oAddress'],
                                              fontsize: 25,
                                              fontweight: FontWeight.normal,
                                              color: mainColor,
                                              underLine: TextDecoration.none),
                                          trailing: Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    ordersSnapshot['ostatus'] ==
                                                            "true"
                                                        ? Colors.green
                                                        : redClr,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 20),
                                          child: TextUtils(
                                              text: ordersSnapshot['oName'],
                                              fontsize: 30,
                                              fontweight: FontWeight.bold,
                                              color: mainColor,
                                              underLine: TextDecoration.none),
                                        ),
                                      ),
                                    ],
                                  )

                                  // Container(
                                  //   padding: const EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //       color: lightGreyclr,
                                  //       borderRadius: BorderRadius.circular(15)),
                                  //   child: Center(
                                  //     child: ListTile(
                                  //       title: TextUtils(
                                  //           text: "0${ordersSnapshot['oPhone']}",
                                  //           fontsize: 25,
                                  //           fontweight: FontWeight.normal,
                                  //           color: mainColor,
                                  //           underLine: TextDecoration.none),
                                  //       subtitle: TextUtils(
                                  //           text: ordersSnapshot['oAddress'],
                                  //           fontsize: 20,
                                  //           fontweight: FontWeight.normal,
                                  //           color: mainColor,
                                  //           underLine: TextDecoration.none),
                                  //       trailing: Container(
                                  //         decoration: BoxDecoration(
                                  //             color: ordersSnapshot['ostatus'] ==
                                  //                     "true"
                                  //                 ? Colors.green
                                  //                 : redClr,
                                  //             borderRadius:
                                  //                 BorderRadius.circular(15)),
                                  //         height: 20,
                                  //         width: 20,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  ));
                        });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
