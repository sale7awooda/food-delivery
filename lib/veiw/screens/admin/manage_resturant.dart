import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  String img = 'images/groceries.png';
  DocumentSnapshot? rID;
  static String fResturantName = 'restName';
  static String fResturantOwner = 'restOwner';
  static String fResturantPass = 'restPass';
  static String fResturantLoc = 'resLoc';
  static String fResturantDetails = 'restDetail';
  static String fResturantImg = 'restImg';

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
                                    return InkWell(
                                      hoverColor: Colors.lightBlue[200],
                                      onTap: () {
                                        setState(() {
                                          rID = resturantSnapshot;
                                        });

                                        rnameCtrl.text =
                                            resturantSnapshot[fResturantName];
                                        rOwnerCtrl.text =
                                            resturantSnapshot[fResturantOwner];
                                        rPassCtrl.text =
                                            resturantSnapshot[fResturantPass];
                                        rDetailsCtrl.text = resturantSnapshot[
                                            fResturantDetails];
                                        rLocationCtrl.text =
                                            resturantSnapshot[fResturantLoc];
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            color: lightGreyclr,
                                            child: Center(
                                                child: ResurantWdgt(
                                              title: resturantSnapshot[
                                                  fResturantName],
                                              subtitle: resturantSnapshot[
                                                  fResturantDetails],
                                            )),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                        }
                        return const Center(
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
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: IconButton(
                                  onPressed: () {
                                    //clear();
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      fstoreCtrl.addResturant(
                                        ResturantModel(
                                          rname: rnameCtrl.value.text,
                                          rowner: rOwnerCtrl.value.text,
                                          rpass: rPassCtrl.value.text,
                                          rloc: rLocationCtrl.value.text,
                                          rdetial: rDetailsCtrl.value.text,
                                          // rimg:"images/groceries.png"
                                        ),
                                      );
                                      Get.snackbar("تنبية", "تم الحفظ بنجاااح",
                                          maxWidth: 400,
                                          snackPosition: SnackPosition.BOTTOM,
                                          isDismissible: true,
                                          duration: const Duration(seconds: 3));
                                      //clearCtrl();
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 35,
                                    color: mainColor,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: IconButton(
                                  onPressed: () {
                                    Get.snackbar("حفظ",
                                        "أنت على وشك حذف ملف , هل ترغب بالاستمرار",
                                        snackPosition: SnackPosition.BOTTOM,
                                        isDismissible: true,
                                        maxWidth: 400,
                                        duration: const Duration(seconds: 5),
                                        mainButton: TextButton(
                                            onPressed: () {
                                              fstoreCtrl.removeResturant(rID!);
                                              clear();
                                            },
                                            child: const Text("نعم")));
                                  },
                                  icon: const Icon(Icons.remove,
                                      size: 35, color: mainColor)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: IconButton(
                                  onPressed: () {
                                     if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                    fstoreCtrl.updateResturant(
                                        rID!,
                                        ResturantModel(
                                          rname: rnameCtrl.value.text,
                                          rowner: rOwnerCtrl.value.text,
                                          rpass: rPassCtrl.value.text,
                                          rloc: rLocationCtrl.value.text,
                                          rdetial: rDetailsCtrl.value.text,
                                          // rimg:"images/groceries.png"
                                        ),);
                                        Get.snackbar("تعديل", "تم التعديل بنجاااح",
                                          maxWidth: 400,
                                          snackPosition: SnackPosition.BOTTOM,
                                          isDismissible: true,
                                          duration: const Duration(seconds: 3)); }
                                  },
                                  icon: const Icon(Icons.update,
                                      size: 35, color: mainColor)),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 6,
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
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.image_outlined,
                                                        size: 20,
                                                      )),
                                                  SizedBox(
                                                    width: 100,
                                                    height: 100,
                                                    child: Image.asset(
                                                        "images/groceries.png"),
                                                  ),
                                                ],
                                              ),
                                              TextFormWdgt(
                                                controller: rnameCtrl,
                                                lable: const Text(
                                                    "Resturant Name "),
                                                validator: (value) {
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
                                                  controller: rOwnerCtrl,
                                                  lable: const Text(
                                                      "Resturant Owner "),
                                                  validator: (value) {
                                                    if (value
                                                        .toString()
                                                        .isEmpty) {
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
                                                    if (value
                                                        .toString()
                                                        .isEmpty) {
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
                                                    if (value
                                                        .toString()
                                                        .isEmpty) {
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
                                                    if (value
                                                        .toString()
                                                        .isEmpty) {
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
