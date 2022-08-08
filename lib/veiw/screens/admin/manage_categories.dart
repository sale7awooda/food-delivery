import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/category_model.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/admin/text_form_wdgt.dart';
import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt2.dart';

import 'package:orders/veiw/widgets/user/text_utils.dart';

class ManageCategories extends StatefulWidget {
  const ManageCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<ManageCategories> createState() => _ManageCategoriesState();
}

class _ManageCategoriesState extends State<ManageCategories> {
  final _formKey = GlobalKey<FormState>();
  final scrollctrl = ScrollController();
  final fstoreCtrl = Get.find<FirestoreController>();

  String name = '';
  String detail = '';
  String cimg = 'images/groceries.png';
  DocumentSnapshot? cID;
  static String fCategoryName = 'catName';
  static String fCategoryDetails = 'catDetail';
  static String fCategoryImg = 'catImg';
  static String imgREF = 'category';

  // ignore: unused_field
  static String? fCategoryID ;

  final cnameCtrl = TextEditingController();

  final cIDCtrl = TextEditingController();
  final cImageCtrl = TextEditingController();
  final cDetailsCtrl = TextEditingController();
  //String _rname,_rowner,rpass,rloc,rdetal;
  clear() {
    cnameCtrl.clear();
    cDetailsCtrl.clear();
    cIDCtrl.clear();
    cImageCtrl.clear();
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
                        text: "قائمة الاصناف",
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
                      stream: fstoreCtrl.categoryCol.snapshots(),
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
                                    final DocumentSnapshot categorySnapshot =
                                        streamSnapshot.data!.docs[index];

                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        hoverColor: Colors.lightBlue[200],
                                        onTap: () {
                                          setState(() {
                                            cID = categorySnapshot;
                                            fCategoryID = streamSnapshot
                                                .data!.docs[index].id;
                                            //print(fCategoryID);
                                          });

                                          cnameCtrl.text =
                                              categorySnapshot[fCategoryName];

                                          cDetailsCtrl.text = categorySnapshot[
                                              fCategoryDetails];
                                          cImageCtrl.text = categorySnapshot[
                                              fCategoryImg];
                                        },
                                        child: ResurantWdgt2(
                                          title:
                                              categorySnapshot[fCategoryName],
                                          subtitle: categorySnapshot[
                                              fCategoryDetails],
                                          imgUrl:
                                              categorySnapshot[fCategoryImg],
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
                        // flex: 6,
                        child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const TextUtils(
                            text: "بيانات الصنف ",
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                        cImageCtrl.text = value;
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
                                                      fstoreCtrl.addCategory(
                                                        CategoryModel(
                                                            cname: cnameCtrl
                                                                .value.text,
                                                            cdetial:
                                                                cDetailsCtrl
                                                                    .value.text,
                                                            cimgURL: cImageCtrl
                                                                .text
                                                            // rimg:"images/groceries.png"
                                                            ),
                                                      );clear();
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
                                                      //clearCtrl();
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
                                                        "أنت على وشك حذف ملف مهم للنظام , هل ترغب بالاستمرار",
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
                                                                  .removeCategory(
                                                                      cID!);
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
                                                  // Icon(
                                                  //     Icons.remove,
                                                  //     size: 35,
                                                  //     color: mainColor)
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      fstoreCtrl.updateCategory(
                                                        cID!,
                                                        CategoryModel(
                                                            cname: cnameCtrl
                                                                .value.text,
                                                            // cCode: cCodeCtrl
                                                            // .value.text,
                                                            cId: cID.toString(),
                                                            cdetial:
                                                                cDetailsCtrl
                                                                    .value.text,
                                                            cimgURL: cImageCtrl.value.text
                                                            // rimg:"images/groceries.png"
                                                            ),
                                                      );clear();
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
                                              controller: cImageCtrl,
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
                                            controller: cnameCtrl,
                                            lable: const Text("اسم الصنف  "),
                                            validator: (value) {
                                              if (value.toString().isEmpty) {
                                                return "الحقل لايجب ان يكون فارغ";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                         
                                          TextFormWdgt(
                                              controller: cDetailsCtrl,
                                              lable:
                                                  const Text(" تفاصيل الصنف "),
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
