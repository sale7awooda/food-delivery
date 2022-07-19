import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class RestOrdersScreen extends StatefulWidget {
  RestOrdersScreen({Key? key}) : super(key: key);

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

  final _formKey = GlobalKey<FormState>();

  final String ffoodName = 'foodName';

  final String ffoodDetails = 'foodDetails';

  final String ffoodImg = 'foodImgUrl';

  final String ffoodResturantID = 'foodResturantID';

  final String ffoodPrice = 'foodPrice';

  //final ordernameCtrl = TextEditingController();
  final orderPhoneCtrl = TextEditingController();

  final orderAddressCtrl = TextEditingController();

  String? item1 = "item";

  String? item2 = "item";

  String? item3 = "item";

  String? item4 = "item";

  String? item5 = "item";

  bool v1 = false;

  bool v2 = false;

  bool v3 = false;

  bool v4 = false;

  bool v5 = false;

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
    //var cartID = authctrl.cartid;
    // int pcount=0;
    // DocumentSnapshot<Object?>? ordersList;
    List<dynamic> items =[];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder(
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
                              // int selector =
                              //     streamSnapshot.data!.docs.length;
                               items =
                                  List.from(ordersSnapshot['oItems']);
                              switch (items.length) {
                                case 1:
                                  item1 = items[0]["foodName"];
                                  v1 = true;
                                  break;
                                case 2:
                                  item1 = items[0]["foodName"];
                                  item2 = items[1]["foodName"];
                                  v1 = true;
                                  v2 = true;
                                  break;
                                case 3:
                                  v1 = true;
                                  v2 = true;
                                  v3 = true;
                                  item1 = items[0]["foodName"];
                                  item2 = items[1]["foodName"];
                                  item3 = items[2]["foodName"];
                                  break;
                                case 4:
                                  v1 = true;
                                  v2 = true;
                                  v3 = true;
                                  v4 = true;
                                  item1 = items[0]["foodName"];
                                  item2 = items[1]["foodName"];
                                  item3 = items[2]["foodName"];
                                  item4 = items[3]["foodName"];
                                  break;
                                case 5:
                                  v1 = true;
                                  v2 = true;
                                  v3 = true;
                                  v4 = true;
                                  v5 = true;
                                  item1 = items[0]["foodName"];
                                  item2 = items[1]["foodName"];
                                  item3 = items[2]["foodName"];
                                  item4 = items[3]["foodName"];
                                  item5 = items[4]["foodName"];
                                  break;
                                default:
                              }
                             

                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                  child: InkWell(
                                    hoverColor: Colors.lightBlue[200],
                                    onTap: () {
                                      Get.defaultDialog(
                                          title: "تفاصيل الطلب ",
                                          content: Column(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            children: [
                                              Visibility(
                                                  visible: v1,
                                                  child: TextUtils(
                                                      text: item1!,
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none)),
                                              Visibility(
                                                visible: v2,
                                                child: TextUtils(
                                                    text: item2!,
                                                    fontsize: 20,
                                                    fontweight: FontWeight.bold,
                                                    color: mainColor,
                                                    underLine:
                                                        TextDecoration.none),
                                              ),
                                              Visibility(
                                                  visible: v3,
                                                  child: TextUtils(
                                                      text: item3!,
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none)),
                                              Visibility(
                                                  visible: v4,
                                                  child: TextUtils(
                                                      text: item4!,
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none)),
                                              Visibility(
                                                  visible: v5,
                                                  child: TextUtils(
                                                      text: item5!,
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none)),

                                              
                                            ],
                                          ),
                                          confirm: ButtonWdgt(
                                              text: "قبول",
                                              onPress: () {
                                                print(items);
                                                print(items.length);
                                              }),
                                          cancel: ButtonWdgt(
                                              text: "رفض", onPress: () {}));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: lightGreyclr,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: ListTile(
                                            title: TextUtils(
                                                text: ordersSnapshot['oPhone']
                                                    .toString(),
                                                fontsize: 25,
                                                fontweight: FontWeight.normal,
                                                color: mainColor,
                                                underLine: TextDecoration.none),
                                            subtitle: TextUtils(
                                                text:
                                                    ordersSnapshot['oAddress'],
                                                fontsize: 20,
                                                fontweight: FontWeight.normal,
                                                color: mainColor,
                                                underLine:
                                                    TextDecoration.none)),
                                      ),
                                    ),
                                  ));
                            });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}


// switch (selector) {
//                                       case 0:
//                                         {
//                                           idCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodID];
//                                           nCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodName];
//                                           dCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodDetails];
//                                           imgCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodImg];
//                                           pCtrl.text = (streamSnapshot
//                                                   .data!.docs[0][ffoodPrice])
//                                               .toString();
//                                           ridCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodResturantID];
//                                         }
//                                         break;
//                                       case 1:
//                                         {
//                                           idCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodID];
//                                           nCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodName];
//                                           dCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodDetails];
//                                           imgCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodImg];
//                                           pCtrl.text = (streamSnapshot
//                                                   .data!.docs[0][ffoodPrice])
//                                               .toString();
//                                           ridCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodResturantID];
//                                           idCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodID];
//                                           nCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodName];
//                                           dCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodDetails];
//                                           imgCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodImg];
//                                           pCtrl1.text = (streamSnapshot
//                                                   .data!.docs[1][ffoodPrice])
//                                               .toString();
//                                           ridCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodResturantID];
//                                         }
//                                         break;
//                                       case 2:
//                                         {
//                                           idCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodID];
//                                           nCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodName];
//                                           dCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodDetails];
//                                           imgCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodImg];
//                                           pCtrl.text = (streamSnapshot
//                                                   .data!.docs[0][ffoodPrice])
//                                               .toString();
//                                           ridCtrl.text =
//                                               foodSnapshot[ffoodResturantID];
//                                           idCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodID];
//                                           nCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodName];
//                                           dCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodDetails];
//                                           imgCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodImg];
//                                           pCtrl1.text = (streamSnapshot
//                                                   .data!.docs[1][ffoodPrice])
//                                               .toString();
//                                           ridCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodResturantID];
//                                           idCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodID];
//                                           nCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodName];
//                                           dCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodDetails];
//                                           imgCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodImg];
//                                           pCtrl2.text = (streamSnapshot
//                                                   .data!.docs[2][ffoodPrice])
//                                               .toString();
//                                           ridCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodResturantID];
//                                         }
//                                         break;
//                                       case 3:
//                                         {
//                                           idCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodID];
//                                           nCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodName];
//                                           dCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodDetails];
//                                           imgCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodImg];
//                                           pCtrl.text = (streamSnapshot
//                                                   .data!.docs[0][ffoodPrice])
//                                               .toString();
//                                           ridCtrl.text =
//                                               foodSnapshot[ffoodResturantID];
//                                           idCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodID];
//                                           nCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodName];
//                                           dCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodDetails];
//                                           imgCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodImg];
//                                           pCtrl1.text = (streamSnapshot
//                                                   .data!.docs[1][ffoodPrice])
//                                               .toString();
//                                           ridCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodResturantID];
//                                           idCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodID];
//                                           nCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodName];
//                                           dCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodDetails];
//                                           imgCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodImg];
//                                           pCtrl2.text = (streamSnapshot
//                                                   .data!.docs[2][ffoodPrice])
//                                               .toString();
//                                           ridCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodResturantID];
//                                           idCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodID];
//                                           nCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodName];
//                                           dCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodDetails];
//                                           imgCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodImg];
//                                           pCtrl3.text = (streamSnapshot
//                                                   .data!.docs[3][ffoodPrice])
//                                               .toString();
//                                           ridCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodResturantID];
//                                         }
//                                         break;
//                                       case 4:
//                                         {
//                                           idCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodID];
//                                           nCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodName];
//                                           dCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodDetails];
//                                           imgCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodImg];
//                                           pCtrl.text = (streamSnapshot
//                                                   .data!.docs[0][ffoodPrice])
//                                               .toString();
//                                           ridCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodResturantID];
//                                           idCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodID];
//                                           nCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodName];
//                                           dCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodDetails];
//                                           imgCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodImg];
//                                           pCtrl1.text = (streamSnapshot
//                                                   .data!.docs[1][ffoodPrice])
//                                               .toString();
//                                           ridCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodResturantID];
//                                           idCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodID];
//                                           nCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodName];
//                                           dCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodDetails];
//                                           imgCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodImg];
//                                           pCtrl2.text = (streamSnapshot
//                                                   .data!.docs[2][ffoodPrice])
//                                               .toString();
//                                           ridCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodResturantID];
//                                           idCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodID];
//                                           nCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodName];
//                                           dCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodDetails];
//                                           imgCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodImg];
//                                           pCtrl3.text = (streamSnapshot
//                                                   .data!.docs[3][ffoodPrice])
//                                               .toString();
//                                           ridCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodResturantID];
//                                           idCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodID];
//                                           nCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodName];
//                                           dCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodDetails];
//                                           imgCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodImg];
//                                           pCtrl4.text = (streamSnapshot
//                                                   .data!.docs[4][ffoodPrice])
//                                               .toString();
//                                           ridCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodResturantID];
//                                         }
//                                         break;
//                                       case 5:
//                                         {
//                                           idCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodID];
//                                           nCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodName];
//                                           dCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodDetails];
//                                           imgCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodImg];
//                                           pCtrl.text = (streamSnapshot
//                                                   .data!.docs[0][ffoodPrice])
//                                               .toString();
//                                           ridCtrl.text = streamSnapshot
//                                               .data!.docs[0][ffoodResturantID];
//                                           idCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodID];
//                                           nCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodName];
//                                           dCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodDetails];
//                                           imgCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodImg];
//                                           pCtrl1.text = (streamSnapshot
//                                                   .data!.docs[1][ffoodPrice])
//                                               .toString();
//                                           ridCtrl1.text = streamSnapshot
//                                               .data!.docs[1][ffoodResturantID];
//                                           idCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodID];
//                                           nCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodName];
//                                           dCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodDetails];
//                                           imgCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodImg];
//                                           pCtrl2.text = (streamSnapshot
//                                                   .data!.docs[2][ffoodPrice])
//                                               .toString();
//                                           ridCtrl2.text = streamSnapshot
//                                               .data!.docs[2][ffoodResturantID];
//                                           idCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodID];
//                                           nCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodName];
//                                           dCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodDetails];
//                                           imgCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodImg];
//                                           pCtrl3.text = (streamSnapshot
//                                                   .data!.docs[3][ffoodPrice])
//                                               .toString();
//                                           ridCtrl3.text = streamSnapshot
//                                               .data!.docs[3][ffoodResturantID];
//                                           idCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodID];
//                                           nCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodName];
//                                           dCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodDetails];
//                                           imgCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodImg];
//                                           pCtrl4.text = (streamSnapshot
//                                                   .data!.docs[4][ffoodPrice])
//                                               .toString();
//                                           ridCtrl4.text = streamSnapshot
//                                               .data!.docs[4][ffoodResturantID];
//                                           idCtrl5.text = streamSnapshot
//                                               .data!.docs[5][ffoodID];
//                                           nCtrl5.text = streamSnapshot
//                                               .data!.docs[5][ffoodName];
//                                           dCtrl5.text = streamSnapshot
//                                               .data!.docs[5][ffoodDetails];
//                                           imgCtrl5.text = streamSnapshot
//                                               .data!.docs[5][ffoodImg];
//                                           pCtrl5.text = (streamSnapshot
//                                                   .data!.docs[5][ffoodPrice])
//                                               .toString();
//                                           ridCtrl5.text = streamSnapshot
//                                               .data!.docs[5][ffoodResturantID];
//                                         }
//                                         break;

//                                       default:
//                                     }