// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/admin/text_form_wdgt.dart';

import 'package:orders/veiw/widgets/user/text_utils.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({
    Key? key,
  }) : super(key: key);
  final String ffoodName = 'foodName';
  final String ffoodDetails = 'foodDetails';
  final String ffoodImgURL = 'foodImgUrl';
  final String ffoodCategID = 'foodCategortID';
  final String ffoodResturantID = 'foodResturantID';
  final String ffoodID = 'foodID';
  final String ffoodPrice = 'foodPrice';
  final String imgREF = 'foods';

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  final fstoreCtrl = Get.find<FirestoreController>();
  final scrollctrl = ScrollController();
  // final scrollctr2 = ScrollController();
  //final _formKey = GlobalKey<FormState>();
  final oPhoneCtrl = TextEditingController();
  final oRestNameCtrl = TextEditingController();
  final oTotalPriceCtrl = TextEditingController();
  final oAddressCtrl = TextEditingController();
  final oNameCtrl = TextEditingController();
  final item1Ctrl = TextEditingController();
  final item2Ctrl = TextEditingController();
  final item3Ctrl = TextEditingController();
  final item4Ctrl = TextEditingController();
  final item5Ctrl = TextEditingController();
  String? item1 = "item";
  String? item2 = "item";
  String? item3 = "item";
  String? item4 = "item";
  String? item5 = "item";
  bool v0 = false;
  bool v1 = false;
  bool v2 = false;
  bool v3 = false;
  bool v4 = false;
  bool v5 = false;
  bool v6 = false;
  bool v7 = false;
  bool v8 = false;

  // final _random = Random();

  clearCtrls() {
    oPhoneCtrl.clear();
    oTotalPriceCtrl.clear();
    oRestNameCtrl.clear();
    item2Ctrl.clear();
    oAddressCtrl.clear();
    oNameCtrl.clear();
    item1Ctrl.clear();
    item5Ctrl.clear();
    item3Ctrl.clear();
    item4Ctrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    // String name = '';
    // String detail = '';
    // bool fstatus = true;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(children: [
              const Center(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextUtils(
                          text: "الطلبات",
                          fontsize: 25,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none))),
              const Divider(indent: 8.0, endIndent: 8.0),
              Expanded(
                  child: StreamBuilder(
                      stream: fstoreCtrl.orderCol.snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return !streamSnapshot.hasData
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  controller: scrollctrl,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot ordersSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    List<dynamic> items =
                                        List.from(ordersSnapshot['oItems']);
                                    switch (items.length) {
                                      case 1:
                                        item1 = items[0]["foodName"];
                                        v0 = true;
                                        v1 = true;
                                        v2 = true;
                                        v3 = true;
                                        break;
                                      case 2:
                                        item1 = items[0]["foodName"];
                                        item2 = items[1]["foodName"];
                                        v0 = true;
                                        v1 = true;
                                        v2 = true;
                                        v3 = true;
                                        v4 = true;

                                        break;
                                      case 3:
                                        v0 = true;
                                        v1 = true;
                                        v2 = true;
                                        v3 = true;
                                        v4 = true;
                                        v5 = true;
                                        item1 = items[0]["foodName"];
                                        item2 = items[1]["foodName"];
                                        item3 = items[2]["foodName"];
                                        break;
                                      case 4:
                                        v0 = true;
                                        v1 = true;
                                        v2 = true;
                                        v3 = true;
                                        v4 = true;
                                        v5 = true;
                                        v6 = true;
                                        item1 = items[0]["foodName"];
                                        item2 = items[1]["foodName"];
                                        item3 = items[2]["foodName"];
                                        item4 = items[3]["foodName"];
                                        break;
                                      case 5:
                                        v0 = true;
                                        v1 = true;
                                        v2 = true;
                                        v3 = true;
                                        v4 = true;
                                        v5 = true;
                                        v6 = true;
                                        v7 = true;
                                        item1 = items[0]["foodName"];
                                        item2 = items[1]["foodName"];
                                        item3 = items[2]["foodName"];
                                        item4 = items[3]["foodName"];
                                        item5 = items[4]["foodName"];
                                        break;
                                      default:
                                    }
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            clearCtrls();
                                            oPhoneCtrl.text =
                                                ordersSnapshot['oPhone']
                                                    .toString();
                                            oAddressCtrl.text =
                                                ordersSnapshot['oAddress'];
                                            oRestNameCtrl.text =
                                                ordersSnapshot['restName'];
                                            oTotalPriceCtrl.text =
                                                ordersSnapshot['oTotalPrice']
                                                    .toString();
                                            oNameCtrl.text =
                                                ordersSnapshot['oName'];
                                            switch (items.length) {
                                              case 1:
                                                item1 = items[0]["foodName"];
                                                v0 = true;
                                                v1 = true;
                                                v2 = true;
                                                v3 = true;
                                                v4 = false;
                                                v5 = false;
                                                v6 = false;
                                                v7 = false;
                                                v8 = true;
                                                item1Ctrl.text =
                                                    item1.toString();
                                                break;
                                              case 2:
                                                item1 = items[0]["foodName"];
                                                item2 = items[1]["foodName"];
                                                v0 = true;
                                                v1 = true;
                                                v2 = true;
                                                v3 = true;
                                                v4 = true;
                                                v5 = false;
                                                v6 = false;
                                                v7 = false;
                                                v8 = true;
                                                item1Ctrl.text =
                                                    item1.toString();
                                                item2Ctrl.text =
                                                    item2.toString();

                                                break;
                                              case 3:
                                                v0 = true;
                                                v1 = true;
                                                v2 = true;
                                                v3 = true;
                                                v4 = true;
                                                v5 = true;
                                                v6 = false;
                                                v7 = false;
                                                v8 = true;
                                                item1 = items[0]["foodName"];
                                                item2 = items[1]["foodName"];
                                                item3 = items[2]["foodName"];
                                                item1Ctrl.text =
                                                    item1.toString();
                                                item2Ctrl.text =
                                                    item2.toString();
                                                item3Ctrl.text =
                                                    item3.toString();
                                                break;
                                              case 4:
                                                v0 = true;
                                                v1 = true;
                                                v2 = true;
                                                v3 = true;
                                                v4 = true;
                                                v5 = true;
                                                v6 = true;
                                                v7 = false;
                                                v8 = true;
                                                item1 = items[0]["foodName"];
                                                item2 = items[1]["foodName"];
                                                item3 = items[2]["foodName"];
                                                item4 = items[3]["foodName"];
                                                item1Ctrl.text =
                                                    item1.toString();
                                                item2Ctrl.text =
                                                    item2.toString();
                                                item3Ctrl.text =
                                                    item3.toString();
                                                item4Ctrl.text =
                                                    item4.toString();
                                                break;
                                              case 5:
                                                v0 = true;
                                                v1 = true;
                                                v2 = true;
                                                v3 = true;
                                                v4 = true;
                                                v5 = true;
                                                v6 = true;
                                                v7 = true;
                                                v8 = true;
                                                item1 = items[0]["foodName"];
                                                item2 = items[1]["foodName"];
                                                item3 = items[2]["foodName"];
                                                item4 = items[3]["foodName"];
                                                item5 = items[4]["foodName"];
                                                item1Ctrl.text =
                                                    item1.toString();
                                                item2Ctrl.text =
                                                    item2.toString();
                                                item3Ctrl.text =
                                                    item3.toString();
                                                item4Ctrl.text =
                                                    item4.toString();
                                                item5Ctrl.text =
                                                    item5.toString();
                                                break;
                                              default:
                                            }
                                          });
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Stack(children: [
                                                  Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  30)),
                                                      elevation: 10,
                                                      shadowColor:
                                                          Colors.black38,
                                                      child: ListTile(
                                                          contentPadding:
                                                              const EdgeInsets.all(
                                                                  25),
                                                          title: TextUtils(
                                                              text:
                                                                  "0${ordersSnapshot['oPhone']}",
                                                              fontsize: 20,
                                                              fontweight: FontWeight
                                                                  .normal,
                                                              color: mainColor,
                                                              underLine:
                                                                  TextDecoration
                                                                      .none),
                                                          subtitle: TextUtils(
                                                              text: ordersSnapshot[
                                                                  'oAddress'],
                                                              fontsize: 20,
                                                              fontweight: FontWeight
                                                                  .normal,
                                                              color: mainColor,
                                                              underLine:
                                                                  TextDecoration
                                                                      .none),
                                                          trailing: Container(
                                                              decoration: BoxDecoration(color: ordersSnapshot['ostatus'] == "true" ? Colors.green : redClr, borderRadius: BorderRadius.circular(15)),
                                                              height: 20,
                                                              width: 20))),
                                                  Align(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      20),
                                                          child: TextUtils(
                                                              text:
                                                                  ordersSnapshot[
                                                                      'oName'],
                                                              fontsize: 22,
                                                              fontweight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: mainColor,
                                                              underLine:
                                                                  TextDecoration
                                                                      .none)))
                                                ]))));
                                  });
                        }
                        return const Center(child: CircularProgressIndicator());
                      }))
            ])),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: v0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AbsorbPointer(
                            child: TextFormWdgt(
                              controller: oRestNameCtrl,
                              lable: const Text("اسم المطعم "),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "الحقل لايجب ان يكون فارغ";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AbsorbPointer(
                            child: TextFormWdgt(
                              controller: oTotalPriceCtrl,
                              lable: const Text("المبلغ الكلي "),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "الحقل لايجب ان يكون فارغ";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    )),
                Visibility(
                    visible: v1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: AbsorbPointer(
                                  child: TextFormWdgt(
                                      controller: oNameCtrl,
                                      lable: const Text("اسم العميل "),
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "الحقل لايجب ان يكون فارغ";
                                        } else {
                                          return null;
                                        }
                                      }))),
                          Flexible(
                              child: AbsorbPointer(
                                  child: TextFormWdgt(
                                      controller: oPhoneCtrl,
                                      lable: const Text("رقم هاتف العميل "),
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "الحقل لايجب ان يكون فارغ";
                                        } else {
                                          return null;
                                        }
                                      })))
                        ])),
                Visibility(
                  visible: v2,
                  child: AbsorbPointer(
                    child: TextFormWdgt(
                      controller: oAddressCtrl,
                      lable: const Text("عنوان العميل "),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "الحقل لايجب ان يكون فارغ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: v3,
                  child: AbsorbPointer(
                    child: TextFormWdgt(
                      controller: item1Ctrl,
                      lable: const Text("العنصر الاول  "),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "الحقل لايجب ان يكون فارغ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: v4,
                  child: AbsorbPointer(
                    child: TextFormWdgt(
                      controller: item2Ctrl,
                      lable: const Text("العنصر الثاني "),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "الحقل لايجب ان يكون فارغ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: v5,
                  child: AbsorbPointer(
                    child: TextFormWdgt(
                      controller: item3Ctrl,
                      lable: const Text("العنصر الثالث "),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "الحقل لايجب ان يكون فارغ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: v6,
                  child: AbsorbPointer(
                    child: TextFormWdgt(
                      controller: item4Ctrl,
                      lable: const Text("العنصر الرابع  "),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "الحقل لايجب ان يكون فارغ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: v7,
                  child: AbsorbPointer(
                    child: TextFormWdgt(
                      controller: item5Ctrl,
                      lable: const Text("العنصر الخامس "),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "الحقل لايجب ان يكون فارغ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        // child: Row(
        //     // mainAxisSize: MainAxisSize.max,
        //     crossAxisAlignment: CrossAxisAlignment.start,

        //     // mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Expanded(
        //           // flex: 6,
        //           child: Column(
        //         children: [
        //           const SizedBox(height: 10),
        //           const TextUtils(
        //               text: "بيانات الطعام ",
        //               fontsize: 30,
        //               fontweight: FontWeight.bold,
        //               color: mainColor,
        //               underLine: TextDecoration.none),
        //           const Divider(),
        //           const SizedBox(height: 20),
        //           Expanded(
        //             child: ListView(
        //               scrollDirection: Axis.vertical,
        //               shrinkWrap: true,
        //               controller: ScrollController(),
        //               // crossAxisAlignment: CrossAxisAlignment.center,
        //               // mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   //mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: [
        //                     const Expanded(
        //                       flex: 1,
        //                       child: TextUtils(
        //                           text: "Select Resturant",
        //                           fontsize: 20,
        //                           fontweight: FontWeight.bold,
        //                           color: mainColor,
        //                           underLine: TextDecoration.none),
        //                     ),
        //                     Expanded(
        //                       flex: 4,
        //                       child: Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 10),
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                               color: lightGreyclr,
        //                               borderRadius:
        //                                   BorderRadius.circular(10)),
        //                           height: 50,
        //                           child: StreamBuilder(
        //                               stream: fstoreCtrl.restaurantCol
        //                                   .snapshots(),
        //                               //initialData: initialData,
        //                               builder: (BuildContext context,
        //                                   AsyncSnapshot streamSnapshot2) {
        //                                 if (streamSnapshot2.hasData) {
        //                                   return !streamSnapshot2.hasData
        //                                       ? const Center(
        //                                           child:
        //                                               CircularProgressIndicator())
        //                                       : ListView.builder(
        //                                           scrollDirection:
        //                                               Axis.horizontal,
        //                                           controller: scrollctr2,
        //                                           itemCount: streamSnapshot2
        //                                               .data!.docs.length,
        //                                           itemBuilder:
        //                                               (context, index) {
        //                                             final DocumentSnapshot
        //                                                 resturantSnapshot =
        //                                                 streamSnapshot2
        //                                                     .data!
        //                                                     .docs[index];
        //                                             return Padding(
        //                                               padding:
        //                                                   const EdgeInsets
        //                                                       .all(10.0),
        //                                               child: InkWell(
        //                                                 hoverColor: Colors
        //                                                     .lightBlue[200],
        //                                                 onTap: () {
        //                                                   setState(() {
        //                                                     rID =
        //                                                         resturantSnapshot;
        //                                                     fResturantID =
        //                                                         streamSnapshot2
        //                                                             .data!
        //                                                             .docs[
        //                                                                 index]
        //                                                             .id;
        //                                                     // print(fResturantID);
        //                                                   });

        //                                                   rnameCtrl.text =
        //                                                       streamSnapshot2
        //                                                           .data!
        //                                                           .docs[
        //                                                               index]
        //                                                           .id;
        //                                                 },
        //                                                 child: ClipRRect(
        //                                                   borderRadius:
        //                                                       BorderRadius
        //                                                           .circular(
        //                                                               15),
        //                                                   child: Container(
        //                                                     color:
        //                                                         mainColor,
        //                                                     height: 50,
        //                                                     width: 100,
        //                                                     child: Center(
        //                                                       child: Text(
        //                                                           resturantSnapshot[
        //                                                               fResturantName]),
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                               ),
        //                                             );
        //                                           });
        //                                 }
        //                                 return const Center(
        //                                   child:
        //                                       CircularProgressIndicator(),
        //                                 );
        //                               }),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Row(
        //                   children: [
        //                     const Expanded(
        //                       flex: 1,
        //                       child: TextUtils(
        //                           text: "Select Category",
        //                           fontsize: 20,
        //                           fontweight: FontWeight.bold,
        //                           color: mainColor,
        //                           underLine: TextDecoration.none),
        //                     ),
        //                     Expanded(
        //                       flex: 4,
        //                       child: Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 10),
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                               color: lightGreyclr,
        //                               borderRadius:
        //                                   BorderRadius.circular(10)),
        //                           height: 50,
        //                           //width: 400,

        //                           child: StreamBuilder(
        //                               stream: fstoreCtrl.categoryCol
        //                                   .snapshots(),
        //                               //initialData: initialData,
        //                               builder: (BuildContext context,
        //                                   AsyncSnapshot streamSnapshot3) {
        //                                 if (streamSnapshot3.hasData) {
        //                                   return !streamSnapshot3.hasData
        //                                       ? const Center(
        //                                           child:
        //                                               CircularProgressIndicator())
        //                                       : ListView.builder(
        //                                           scrollDirection:
        //                                               Axis.horizontal,
        //                                           controller: scrollctr3,
        //                                           itemCount: streamSnapshot3
        //                                               .data!.docs.length,
        //                                           itemBuilder:
        //                                               (context, index) {
        //                                             final DocumentSnapshot
        //                                                 categorySnapshot =
        //                                                 streamSnapshot3
        //                                                     .data!
        //                                                     .docs[index];
        //                                             return Padding(
        //                                               padding:
        //                                                   const EdgeInsets
        //                                                       .all(10.0),
        //                                               child: InkWell(
        //                                                 hoverColor: Colors
        //                                                     .lightBlue[200],
        //                                                 onTap: () {
        //                                                   setState(() {
        //                                                     cID =
        //                                                         categorySnapshot;
        //                                                     fCategoryID =
        //                                                         streamSnapshot3
        //                                                             .data!
        //                                                             .docs[
        //                                                                 index]
        //                                                             .id;
        //                                                     // print(fResturantID);
        //                                                   });

        //                                                   cnameCtrl.text =
        //                                                       streamSnapshot3
        //                                                           .data!
        //                                                           .docs[
        //                                                               index]
        //                                                           .id;
        //                                                 },
        //                                                 child: ClipRRect(
        //                                                   borderRadius:
        //                                                       BorderRadius
        //                                                           .circular(
        //                                                               15),
        //                                                   child: Container(
        //                                                     color:
        //                                                         mainColor,
        //                                                     height: 50,
        //                                                     width: 100,
        //                                                     child: Center(
        //                                                       child: Text(
        //                                                           categorySnapshot[
        //                                                               fCategoryName]),
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                               ),
        //                                             );
        //                                           });
        //                                 }
        //                                 return const Center(
        //                                   child:
        //                                       CircularProgressIndicator(),
        //                                 );
        //                               }),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Form(
        //                     key: _formKey,
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 10),
        //                       child: Center(
        //                         child: Column(
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment.center,
        //                           children: [
        //                             IconButton(
        //                                 onPressed: () async {
        //                                   final fpicker = await FilePicker
        //                                       .platform
        //                                       .pickFiles(
        //                                     allowMultiple: false,
        //                                     type: FileType.image,
        //                                     //     allowedExtensions: [
        //                                     //   'jpg, png'
        //                                     // ]
        //                                   );

        //                                   if (fpicker == null) {
        //                                     Get.snackbar("Error",
        //                                         "No Image Was Selected !!!");
        //                                   }
        //                                   if (fpicker != null) {
        //                                     fstoreCtrl
        //                                         .uploadImage(
        //                                             fpicker.files.first,
        //                                             ManageOrders.imgREF)
        //                                         .then(
        //                                       (value) {
        //                                         //print(value);
        //                                         setState(() {
        //                                           fImageCtrl.text = value;
        //                                         });
        //                                       },
        //                                     );
        //                                   }
        //                                 },
        //                                 icon: const Icon(
        //                                   Icons.image_outlined,
        //                                   size: 20,
        //                                 )),
        //                             Padding(
        //                               padding:
        //                                   const EdgeInsets.only(top: 10),
        //                               child: Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   TextButton(
        //                                     onPressed: () {
        //                                       //clear();
        //                                       if (_formKey.currentState!
        //                                           .validate()) {
        //                                         _formKey.currentState!
        //                                             .save();

        //                                         fstoreCtrl
        //                                             .addFood(FoodModel(
        //                                           foodImageURL:
        //                                               fImageCtrl.value.text,
        //                                           foodName:
        //                                               fnameCtrl.value.text,
        //                                           foodDetails: fDetailsCtrl
        //                                               .value.text,
        //                                           foodCategID:
        //                                               cnameCtrl.value.text,
        //                                           foodPrice: int.tryParse(
        //                                               fPriceCtrl
        //                                                   .value.text),
        //                                           foodResturantID:
        //                                               rnameCtrl.value.text,
        //                                         ));
        //                                         clear();

        //                                         Get.snackbar("تنبية",
        //                                             "تم الحفظ بنجاااح",
        //                                             maxWidth: 400,
        //                                             snackPosition:
        //                                                 SnackPosition
        //                                                     .BOTTOM,
        //                                             isDismissible: true,
        //                                             duration:
        //                                                 const Duration(
        //                                                     seconds: 3));
        //                                         clear();
        //                                       }
        //                                     },
        //                                     child: const TextUtils(
        //                                         text: "إضافة",
        //                                         fontsize: 20,
        //                                         fontweight: FontWeight.bold,
        //                                         color: mainColor,
        //                                         underLine:
        //                                             TextDecoration.none),
        //                                   ),
        //                                   TextButton(
        //                                     onPressed: () {
        //                                       Get.snackbar("حذف",
        //                                           "أنت على وشك حذف ملف , هل ترغب بالاستمرار",
        //                                           snackPosition:
        //                                               SnackPosition.BOTTOM,
        //                                           isDismissible: true,
        //                                           maxWidth: 400,
        //                                           duration: const Duration(
        //                                               seconds: 5),
        //                                           mainButton: TextButton(
        //                                               onPressed: () {
        //                                                 fstoreCtrl
        //                                                     .removeFood(
        //                                                         fID!);
        //                                                 clear();
        //                                               },
        //                                               child: const Text(
        //                                                   "نعم")));
        //                                     },
        //                                     child: const TextUtils(
        //                                         text: "حذف",
        //                                         fontsize: 20,
        //                                         fontweight: FontWeight.bold,
        //                                         color: mainColor,
        //                                         underLine:
        //                                             TextDecoration.none),
        //                                   ),
        //                                   TextButton(
        //                                     onPressed: () {
        //                                       if (_formKey.currentState!
        //                                           .validate()) {
        //                                         _formKey.currentState!
        //                                             .save();
        //                                         fstoreCtrl.updateFood(
        //                                             fID!,
        //                                             FoodModel(
        //                                               foodImageURL:
        //                                                   fImageCtrl.text,
        //                                               foodID: fidCtrl.text,
        //                                               foodName: fnameCtrl
        //                                                   .value.text,
        //                                               foodDetails:
        //                                                   fDetailsCtrl
        //                                                       .value.text,
        //                                               foodCategID:
        //                                                   cnameCtrl.text,
        //                                               foodPrice:
        //                                                   int.tryParse(
        //                                                       fPriceCtrl
        //                                                           .value
        //                                                           .text),
        //                                               foodResturantID:
        //                                                   rnameCtrl.text,
        //                                             ));
        //                                         clear();
        //                                         Get.snackbar("تعديل",
        //                                             "تم التعديل بنجاااح",
        //                                             maxWidth: 400,
        //                                             snackPosition:
        //                                                 SnackPosition
        //                                                     .BOTTOM,
        //                                             isDismissible: true,
        //                                             duration:
        //                                                 const Duration(
        //                                                     seconds: 3));
        //                                       }
        //                                     },
        //                                     child: const TextUtils(
        //                                         text: "تعديل",
        //                                         fontsize: 20,
        //                                         fontweight: FontWeight.bold,
        //                                         color: mainColor,
        //                                         underLine:
        //                                             TextDecoration.none),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                             AbsorbPointer(
        //                               child: TextFormWdgt(
        //                                 controller: fImageCtrl,
        //                                 lable: const Text("Food Image "),
        //                                 validator: (value) {
        //                                   if (value.toString().isEmpty) {
        //                                     return "الحقل لايجب ان يكون فارغ";
        //                                   } else {
        //                                     return null;
        //                                   }
        //                                 },
        //                               ),
        //                             ),
        //                             AbsorbPointer(
        //                               child: TextFormWdgt(
        //                                 controller: fidCtrl,
        //                                 lable: const Text("Food ID "),
        //                                 validator: (value) {
        //                                   // if (value.toString().isEmpty) {
        //                                   //   return "الحقل لايجب ان يكون فارغ";
        //                                   // } else {
        //                                   //   return null;
        //                                   // }
        //                                 },
        //                               ),
        //                             ),
        //                             TextFormWdgt(
        //                               controller: fnameCtrl,
        //                               lable: const Text("Food Name "),
        //                               validator: (value) {
        //                                 if (value.toString().isEmpty) {
        //                                   return "الحقل لايجب ان يكون فارغ";
        //                                 } else {
        //                                   return null;
        //                                 }
        //                               },
        //                             ),
        //                             TextFormWdgt(
        //                                 controller: fDetailsCtrl,
        //                                 lable: const Text("Food Details "),
        //                                 validator: (value) {
        //                                   if (value.toString().isEmpty) {
        //                                     return "الحقل لايجب ان يكون فارغ";
        //                                   } else {
        //                                     return null;
        //                                   }
        //                                 }),
        //                             TextFormWdgt(
        //                                 controller: fPriceCtrl,
        //                                 lable: const Text("Food Price "),
        //                                 hint: "ادخل ارقام فقط !!",
        //                                 validator: (value) {
        //                                   if (value.toString().isEmpty) {
        //                                     return "الحقل لايجب ان يكون فارغ";
        //                                   } else {
        //                                     return null;
        //                                   }
        //                                 }),
        //                             AbsorbPointer(
        //                               child: TextFormWdgt(
        //                                   controller: rnameCtrl,
        //                                   lable:
        //                                       const Text(" Food Resturant"),
        //                                   validator: (value) {
        //                                     if (value.toString().isEmpty) {
        //                                       return "الحقل لايجب ان يكون فارغ";
        //                                     } else {
        //                                       return null;
        //                                     }
        //                                   }),
        //                             ),
        //                             AbsorbPointer(
        //                               child: TextFormWdgt(
        //                                   controller: cnameCtrl,
        //                                   lable:
        //                                       const Text(" Food Categort"),
        //                                   validator: (value) {
        //                                     if (value.toString().isEmpty) {
        //                                       return "الحقل لايجب ان يكون فارغ";
        //                                     } else {
        //                                       return null;
        //                                     }
        //                                   }),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           )
        //         ],
        //       ))
        //     ]))
      ],
    );
  }
}
