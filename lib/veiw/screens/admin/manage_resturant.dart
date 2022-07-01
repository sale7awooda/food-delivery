import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as fire_storage;
import 'package:image_network/image_network.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/resturant_model.dart';
// import 'package:orders/logic/controller/firestore_controller.dart';
// import 'package:orders/model/resturant_model.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/admin/text_form_wdgt.dart';
import 'package:orders/veiw/widgets/user/resturant_wdgt.dart';

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
  static String fResturantPass = 'restPass';
  static String fResturantLoc = 'resLoc';
  static String fResturantDetails = 'restDetail';
  static String imgREF = 'resturants';
  static String fResturantImg = 'restImg';

  static String? fResturantID;

  final rnameCtrl = TextEditingController();
  final rOwnerCtrl = TextEditingController();
  final rPassCtrl = TextEditingController();
  final rLocationCtrl = TextEditingController();
  final rImageCtrl = TextEditingController();
  final rDetailsCtrl = TextEditingController();
  //String _rname,_rowner,rpass,rloc,rdetal;
  clear() {
    rnameCtrl.clear();
    rOwnerCtrl.clear();
    rPassCtrl.clear();
    rDetailsCtrl.clear();
    rLocationCtrl.clear();
    rImageCtrl.clear();
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
                                            // print(fResturantID);
                                          });

                                          rnameCtrl.text =
                                              resturantSnapshot[fResturantName];
                                          rOwnerCtrl.text = resturantSnapshot[
                                              fResturantOwner];
                                          rPassCtrl.text =
                                              resturantSnapshot[fResturantPass];
                                          rDetailsCtrl.text = resturantSnapshot[
                                              fResturantDetails];
                                          rLocationCtrl.text =
                                              resturantSnapshot[fResturantLoc];
                                          rImageCtrl.text =
                                              resturantSnapshot[fResturantImg];
                                        },
                                        child: ResurantWdgt(
                                          title:
                                              resturantSnapshot[fResturantName],
                                          subtitle: resturantSnapshot[
                                              fResturantDetails],
                                          imgUrl:
                                              resturantSnapshot[fResturantImg],
                                        ),
                                      ),
                                    );
                                  });
                        }
                        return 
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
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
                                          IconButton(
                                              onPressed: () async {
                                                final fpicker = await FilePicker
                                                    .platform
                                                    .pickFiles(
                                                  allowMultiple: false,
                                                  type: FileType.image,
                                                  //     allowedExtensions: [
                                                  //   'jpg, png'
                                                  // ]
                                                );

                                                if (fpicker == null) {
                                                  Get.snackbar("Error",
                                                      "No Image Was Selected !!!");
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
                                                        rImageCtrl.text = value;
                                                      });
                                                    },
                                                  )
                                                      ;
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.image_outlined,
                                                size: 20,
                                              )),
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
                                                            rpass: rPassCtrl
                                                                .value.text,
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
                                                          rpass: rPassCtrl
                                                              .value.text,
                                                          rloc: rLocationCtrl
                                                              .value.text,
                                                          rdetial: rDetailsCtrl
                                                              .value.text,
                                                          rimgURL: rImageCtrl.value.text
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
                                              lable: const Text(
                                                  "Resturant Image "),
                                            
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
                                            lable:
                                                const Text("Resturant Name "),
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
                                              lable: const Text(
                                                  "Resturant Owner "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: rPassCtrl,
                                              lable: const Text(
                                                  " Owner Password "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: rDetailsCtrl,
                                              lable: const Text(
                                                  " Resturant Details "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: rLocationCtrl,
                                              lable: const Text(
                                                  " Resturant Location "),
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
