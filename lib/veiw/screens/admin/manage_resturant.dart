// ignore_for_file: unused_field

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/resturant_model.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';
// import 'package:orders/model/resturant_model.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/admin/text_form_wdgt.dart';

import 'package:orders/veiw/widgets/user/text_utils.dart';

class ManageResturants extends StatefulWidget {
  const ManageResturants({
    Key? key,
  }) : super(key: key);

  @override
  State<ManageResturants> createState() => _ManageResturantsState();
}

class _ManageResturantsState extends State<ManageResturants> {
  final _formKey = GlobalKey<FormState>();
  final scrollctrl = ScrollController();
  final fstoreCtrl = Get.find<FirestoreController>();

  String name = '';
  String owner = '';
  String pass = '';
  String email = '';
  String loc = '';
  String detail = '';
  String imgName = 'images/groceries.png';
  DocumentSnapshot? rID;
  static String fResturantName = 'restName';
  static String fResturantOwner = 'restOwner';
  static String fResturantStatus = 'restStatus';
  static String fResturantLoc = 'resLoc';
  static String fResturantDetails = 'restDetail';
  static String imgREF = 'resturants';
  static String fResturantImg = 'restImg';
  bool rStatusCtrl = false;

  static String? fResturantID;
  bool picIsLoaded = false;

  String fImagePreview = '';
  final _random = Random();

  final rnameCtrl = TextEditingController();
  final rOwnerCtrl = TextEditingController();
  //final rStatusCtrl = TextEditingController();
  final rLocationCtrl = TextEditingController();
  final rImageCtrl = TextEditingController();
  final rDetailsCtrl = TextEditingController();
  //String _rname,_rowner,rpass,rloc,rdetal;
  clear() {
    rnameCtrl.clear();
    rOwnerCtrl.clear();
    // rStatusCtrl.clear();

    rDetailsCtrl.clear();
    rLocationCtrl.clear();
    rImageCtrl.clear();
    picIsLoaded = false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    // EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                    child: TextUtils(
                        text: "قائمة المطاعم",
                        fontsize: 25,
                        fontweight: FontWeight.bold,
                        color: mainColor,
                        underLine: TextDecoration.none),
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: fstoreCtrl.restaurantCol.snapshots(),
                      //initialData: initialData,
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
                                    final DocumentSnapshot resturantSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        hoverColor: Colors.lightBlue[200],
                                        onTap: () {
                                          setState(() {
                                            rID = resturantSnapshot;
                                            fResturantID = streamSnapshot
                                                .data!.docs[index].id;
                                            fImagePreview = resturantSnapshot[
                                                fResturantImg];
                                            // print(fResturantID);
                                          });

                                          rnameCtrl.text =
                                              resturantSnapshot[fResturantName];
                                          rOwnerCtrl.text = resturantSnapshot[
                                              fResturantOwner];
                                          rStatusCtrl = resturantSnapshot[
                                              fResturantStatus];
                                          rDetailsCtrl.text = resturantSnapshot[
                                              fResturantDetails];
                                          rLocationCtrl.text =
                                              resturantSnapshot[fResturantLoc];
                                          rImageCtrl.text =
                                              resturantSnapshot[fResturantImg];
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Card(
                                                  color: Colors.primaries[
                                                          _random.nextInt(Colors
                                                              .primaries
                                                              .length)][
                                                      _random.nextInt(9) * 100],
                                                  child: ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    title: Text(
                                                        resturantSnapshot[
                                                            fResturantName],
                                                        style: const TextStyle(
                                                            color: mainColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    subtitle: Text(
                                                        resturantSnapshot[
                                                            fResturantDetails],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    trailing: Container(
                                                      decoration: BoxDecoration(
                                                          color: resturantSnapshot[
                                                                  fResturantStatus]
                                                              ? Colors.green
                                                              : redClr,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  )),
                                            )),

                                        // ResurantWdgt(
                                        //   title:
                                        //       resturantSnapshot[fResturantName],
                                        //   subtitle: resturantSnapshot[
                                        //       fResturantDetails],
                                        //   imgUrl:
                                        //       resturantSnapshot[fResturantImg],
                                        //   rStatus: resturantSnapshot[fResturantStatus],

                                        // ),
                                      ),
                                    );
                                  });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Card(
                      color: lightGreyclr,
                      child: AbsorbPointer(
                        child: ImageNetwork(
                          key: ValueKey(fImagePreview),
                          image: fImagePreview,
                          imageCache: CachedNetworkImageProvider(fImagePreview),
                          height: 150,
                          width: 120,
                          duration: 1200,
                          curve: Curves.easeIn,
                          // onPointer: false,
                          debugPrint: false,
                          fullScreen: false,
                          fitAndroidIos: BoxFit.cover,
                          fitWeb: BoxFitWeb.contain,
                          //borderRadius: BorderRadius.circular(70),
                          onLoading: const CircularProgressIndicator(
                            color: Colors.indigoAccent,
                          ),
                          onError: const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Flexible(
              flex: 4,
              child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        // flex: 6,
                        child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const TextUtils(
                            text: "بيانات المطعم",
                            fontsize: 30,
                            fontweight: FontWeight.bold,
                            color: mainColor,
                            underLine: TextDecoration.none),
                        const Divider(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: ScrollController(),
                            children: [
                              Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: picIsLoaded
                                                          ? Colors.green
                                                          : Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  height: 15,
                                                  width: 15),
                                              const SizedBox(width: 10),
                                              IconButton(
                                                  onPressed: () async {
                                                    final fpicker =
                                                        await FilePicker
                                                            .platform
                                                            .pickFiles(
                                                      allowMultiple: false,
                                                      type: FileType.image,
                                                      //     allowedExtensions: [
                                                      //   'jpg, png'
                                                      // ]
                                                    );

                                                    if (fpicker == null) {
                                                      Get.snackbar("خطا",
                                                          "لم يتم اختيار صوره !!!");
                                                    }
                                                    if (fpicker != null) {
                                                      fstoreCtrl
                                                          .uploadImage(
                                                              fpicker
                                                                  .files.first,
                                                              imgREF)
                                                          .then(
                                                        (value) {
                                                          //print(value);
                                                          setState(() {
                                                            rImageCtrl.text =
                                                                value;
                                                            picIsLoaded = true;
                                                          });
                                                        },
                                                      );
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.image_outlined,
                                                    size: 20,
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    //clear();
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      fstoreCtrl.addResturant(
                                                        ResturantModel(
                                                            rname: rnameCtrl
                                                                .value.text,
                                                            rowner: rOwnerCtrl
                                                                .value.text,
                                                            rStatus:
                                                                rStatusCtrl,
                                                            rloc: rLocationCtrl
                                                                .value.text,
                                                            rdetial:
                                                                rDetailsCtrl
                                                                    .value.text,
                                                            rimgURL: rImageCtrl
                                                                .text),
                                                      );

                                                      Get.snackbar("تنبية",
                                                          "تم الحفظ بنجاااح",
                                                          maxWidth: 400,
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          isDismissible: true,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3));
                                                      clear();
                                                    }
                                                  },
                                                  child: const TextUtils(
                                                      text: "إضافة",
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Get.snackbar("حذف",
                                                        "أنت على وشك حذف ملف , هل ترغب بالاستمرار",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        isDismissible: true,
                                                        maxWidth: 400,
                                                        duration:
                                                            const Duration(
                                                                seconds: 5),
                                                        mainButton: TextButton(
                                                            onPressed: () {
                                                              fstoreCtrl
                                                                  .removeResturant(
                                                                      rID!);
                                                              clear();
                                                            },
                                                            child: const Text(
                                                                "نعم")));
                                                  },
                                                  child: const TextUtils(
                                                      text: "حذف",
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      fstoreCtrl
                                                          .updateResturant(
                                                        rID!,
                                                        ResturantModel(
                                                            rname: rnameCtrl
                                                                .value.text,
                                                            rowner: rOwnerCtrl
                                                                .value.text,
                                                            // rStatus:
                                                            //     rStatusCtrl,
                                                            //     .value.text,
                                                            rloc: rLocationCtrl
                                                                .value.text,
                                                            rdetial:
                                                                rDetailsCtrl
                                                                    .value.text,
                                                            rimgURL: rImageCtrl
                                                                .value.text
                                                            // rimg:"images/groceries.png"
                                                            ),
                                                      );
                                                      Get.snackbar("تعديل",
                                                          "تم التعديل بنجاااح",
                                                          maxWidth: 400,
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          isDismissible: true,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3));
                                                    }
                                                  },
                                                  child: const TextUtils(
                                                      text: "تعديل",
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            ),
                                          ),
                                          AbsorbPointer(
                                            child: TextFormWdgt(
                                              controller: rImageCtrl,
                                              lable: const Text("صوره المطعم "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          TextFormWdgt(
                                            controller: rnameCtrl,
                                            lable: const Text("اسم المطعم "),
                                            validator: (value) {
                                              if (value.toString().isEmpty) {
                                                return "الحقل لايجب ان يكون فارغ";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                          TextFormWdgt(
                                              controller: rOwnerCtrl,
                                              lable: const Text("بريد المالك "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: rDetailsCtrl,
                                              lable:
                                                  const Text(" تفاصيل المطعم "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: rLocationCtrl,
                                              lable:
                                                  const Text(" موقع المطعم "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ))
                  ]))
        ]);
  }
}
