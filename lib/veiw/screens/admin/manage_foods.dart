// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt2.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

import '../../../model/food_model.dart';
import '../../widgets/admin/text_form_wdgt.dart';

class ManageFoods extends StatefulWidget {
  const ManageFoods({
    Key? key,
  }) : super(key: key);

  @override
  State<ManageFoods> createState() => _ManageFoodsState();
}

class _ManageFoodsState extends State<ManageFoods> {
  final _formKey = GlobalKey<FormState>();
  final scrollctrl = ScrollController();
  final scrollctr2 = ScrollController();
  final scrollctr3 = ScrollController();
  final fstoreCtrl = Get.find<FirestoreController>();

  String name = '';
  String detail = '';
  String fimg = 'images/groceries.png';
  bool fstatus = true;
  DocumentSnapshot? fID;
  List<DocumentSnapshot> resturantsList = <DocumentSnapshot>[];
  List<DocumentSnapshot> categoriesList = <DocumentSnapshot>[];

  static String ffoodName = 'foodName';
  static String ffoodDetails = 'foodDetails';
  static String ffoodImgURL = 'foodImgUrl';
  static String ffoodCategID = 'foodCategortID';
  static String ffoodResturantID = 'foodResturantID';

  static String ffoodID = 'foodID';
  static String ffoodPrice = 'foodPrice';
  static String imgREF = 'foods';
  final rIDCtrl = TextEditingController();
  final cIDCtrl = TextEditingController();

  DocumentSnapshot? rID;
  static String fResturantName = 'restName';
  static String resName = '';

  static String? fResturantID;

  DocumentSnapshot? cID;
  static String fCategoryName = 'catName';
  static String catName = '';
  static String? fCategoryID;

  //static String ffoodStatus = 'foodStatus';

  final fnameCtrl = TextEditingController();
  final fidCtrl = TextEditingController();
  final fCatIdCtrl = TextEditingController();
  final fImageCtrl = TextEditingController();
  final fDetailsCtrl = TextEditingController();
  final fRestIdCtrl = TextEditingController();
  final fRestNameCtrl = TextEditingController();
  final fCatNameCtrl = TextEditingController();
  final fStatusCtrl = TextEditingController();
  final fPriceCtrl = TextEditingController();
  //final fTimeCtrl = TextEditingController();
  //String _rname,_rowner,rpass,rloc,rdetal;
  clear() {
    fnameCtrl.clear();
    fidCtrl.clear();
    fDetailsCtrl.clear();
    fCatIdCtrl.clear();
    fImageCtrl.clear();
    fPriceCtrl.clear();
    fRestIdCtrl.clear();
    cIDCtrl.clear();
    rIDCtrl.clear();
    fRestNameCtrl.clear();
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
                const Flexible(
                    flex: 1,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextUtils(
                            text: " قائمة الاطعمه",
                            fontsize: 25,
                            fontweight: FontWeight.bold,
                            color: mainColor,
                            underLine: TextDecoration.none),
                      ),
                    )),
                Flexible(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: StreamBuilder(
                        stream: fstoreCtrl.foodCol.snapshots(),
                        //initialData: initialData,
                        builder: (BuildContext context,
                            AsyncSnapshot streamSnapshot) {
                          if (streamSnapshot.hasData) {
                            return !streamSnapshot.hasData
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    controller: scrollctrl,
                                    itemCount: streamSnapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final DocumentSnapshot foodSnapshot =
                                          streamSnapshot.data!.docs[index];
                                      return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            hoverColor: Colors.lightBlue[200],
                                            onTap: () {
                                              setState(() {
                                                fID = foodSnapshot;
                                                ffoodID = streamSnapshot
                                                    .data!.docs[index].id;
                                              });
    
                                              fnameCtrl.text =
                                                  foodSnapshot[ffoodName];
                                              fidCtrl.text = ffoodID;
                                              // streamSnapshot
                                              //     .data!.docs[index].id;
    
                                              fDetailsCtrl.text =
                                                  foodSnapshot[ffoodDetails];
                                              cIDCtrl.text =
                                                  foodSnapshot[ffoodCategID];
                                              rIDCtrl.text = foodSnapshot[
                                                  ffoodResturantID];
                                              fRestNameCtrl.text =
                                                  foodSnapshot[fResturantName];
                                              fCatNameCtrl.text =
                                                  foodSnapshot[fCategoryName];
                                              fImageCtrl.text =
                                                  foodSnapshot[fCategoryName];
    
                                              fPriceCtrl.text =
                                                  foodSnapshot[ffoodPrice]
                                                      .toString();
                                              fImageCtrl.text =
                                                  foodSnapshot[ffoodImgURL];
                                            },
                                            child: ResurantWdgt2(
                                              title: foodSnapshot[ffoodName],
                                              subtitle:
                                                  foodSnapshot[ffoodDetails],
                                              imgUrl: foodSnapshot[ffoodImgURL],
                                            ),
                                          ));
                                    });
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                )
              //,Text("data")
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
                            text: "بيانات الطعام ",
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
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: TextUtils(
                                        text: "Select Resturant",
                                        fontsize: 20,
                                        fontweight: FontWeight.bold,
                                        color: mainColor,
                                        underLine: TextDecoration.none),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: lightGreyclr,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 50,
                                        child: StreamBuilder(
                                            stream: fstoreCtrl.restaurantCol
                                                .snapshots(),
                                            //initialData: initialData,
                                            builder: (BuildContext context,
                                                AsyncSnapshot streamSnapshot2) {
                                              if (streamSnapshot2.hasData) {
                                                return !streamSnapshot2.hasData
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        controller: scrollctr2,
                                                        itemCount:
                                                            streamSnapshot2
                                                                .data!
                                                                .docs
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final DocumentSnapshot
                                                              resturantSnapshot =
                                                              streamSnapshot2
                                                                  .data!
                                                                  .docs[index];
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: InkWell(
                                                              hoverColor: Colors
                                                                      .lightBlue[
                                                                  200],
                                                              onTap: () {
                                                                setState(() {
                                                                  rID =
                                                                      resturantSnapshot;
                                                                  fResturantID =
                                                                      streamSnapshot2
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .id;
                                                                  resName =
                                                                      resturantSnapshot[
                                                                          fResturantName];
                                                                  // print(fResturantID);
                                                                });
    
                                                                rIDCtrl.text =
                                                                    streamSnapshot2
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .id;
                                                                fRestNameCtrl
                                                                        .text =
                                                                    resName;
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  color:
                                                                      mainColor,
                                                                  height: 50,
                                                                  width: 100,
                                                                  child: Center(
                                                                    child: Text(
                                                                        resturantSnapshot[
                                                                            fResturantName]),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: TextUtils(
                                        text: "Select Category",
                                        fontsize: 20,
                                        fontweight: FontWeight.bold,
                                        color: mainColor,
                                        underLine: TextDecoration.none),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: lightGreyclr,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 50,
                                        //width: 400,
    
                                        child: StreamBuilder(
                                            stream: fstoreCtrl.categoryCol
                                                .snapshots(),
                                            //initialData: initialData,
                                            builder: (BuildContext context,
                                                AsyncSnapshot streamSnapshot3) {
                                              if (streamSnapshot3.hasData) {
                                                return !streamSnapshot3.hasData
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        controller: scrollctr3,
                                                        itemCount:
                                                            streamSnapshot3
                                                                .data!
                                                                .docs
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final DocumentSnapshot
                                                              categorySnapshot =
                                                              streamSnapshot3
                                                                  .data!
                                                                  .docs[index];
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: InkWell(
                                                              hoverColor: Colors
                                                                      .lightBlue[
                                                                  200],
                                                              onTap: () {
                                                                setState(() {
                                                                  cID =
                                                                      categorySnapshot;
                                                                  fCategoryID =
                                                                      streamSnapshot3
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .id;
                                                                  catName =
                                                                      categorySnapshot[
                                                                          fCategoryName];
                                                                  // print(
                                                                  //     catName);
                                                                });
    
                                                                cIDCtrl.text =
                                                                    streamSnapshot3
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .id;
                                                                fCatNameCtrl
                                                                        .text =
                                                                    catName;
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  color:
                                                                      mainColor,
                                                                  height: 50,
                                                                  width: 100,
                                                                  child: Center(
                                                                    child: Text(
                                                                        categorySnapshot[
                                                                            fCategoryName]),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                                          fpicker.files.first,
                                                          imgREF)
                                                      .then(
                                                    (value) {
                                                      //print(value);
                                                      setState(() {
                                                        fImageCtrl.text = value;
                                                      });
                                                    },
                                                  );
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
    
                                                      fstoreCtrl
                                                          .addFood(FoodModel(
                                                        foodImageURL: fImageCtrl
                                                            .value.text,
                                                        foodName: fnameCtrl
                                                            .value.text,
                                                        foodDetails:
                                                            fDetailsCtrl
                                                                .value.text,
                                                        foodCategID:
                                                            cIDCtrl.value.text,
                                                        fResturantName:
                                                            fRestNameCtrl.text,
                                                        fCategoryName:
                                                            fCatNameCtrl.text,
                                                        foodPrice: int.tryParse(
                                                            fPriceCtrl
                                                                .value.text),
                                                        foodResturantID:
                                                            rIDCtrl.value.text,
                                                      ));
                                                      clear();
    
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
                                                                  .removeFood(
                                                                      fID!);
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
                                                      fstoreCtrl.updateFood(
                                                          fID!,
                                                          FoodModel(
                                                            foodImageURL:
                                                                fImageCtrl.text,
                                                            foodID:
                                                                fidCtrl.text,
                                                            foodName: fnameCtrl
                                                                .value.text,
                                                            foodDetails:
                                                                fDetailsCtrl
                                                                    .value.text,
                                                            foodCategID:
                                                                cIDCtrl.text,
                                                            foodPrice:
                                                                int.tryParse(
                                                                    fPriceCtrl
                                                                        .value
                                                                        .text),
                                                            foodResturantID:
                                                                rIDCtrl.text,
                                                            fResturantName:
                                                                fRestNameCtrl
                                                                    .text,
                                                            fCategoryName:
                                                                fCatNameCtrl
                                                                    .text,
                                                          ));
                                                      clear();
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
                                              controller: fImageCtrl,
                                              lable: const Text("Food Image "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          // AbsorbPointer(
                                          //   child: TextFormWdgt(
                                          //     controller: fidCtrl,
                                          //     lable: const Text("Food ID "),
                                          //     validator: (value) {
                                          //       // if (value.toString().isEmpty) {
                                          //       //   return "الحقل لايجب ان يكون فارغ";
                                          //       // } else {
                                          //       //   return null;
                                          //       // }
                                          //     },
                                          //   ),
                                          // ),
                                          TextFormWdgt(
                                            controller: fnameCtrl,
                                            lable: const Text("Food Name "),
                                            validator: (value) {
                                              if (value.toString().isEmpty) {
                                                return "الحقل لايجب ان يكون فارغ";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                          TextFormWdgt(
                                              controller: fDetailsCtrl,
                                              lable:
                                                  const Text("Food Details "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: fPriceCtrl,
                                              lable: const Text("Food Price "),
                                              hint: "ادخل ارقام فقط !!",
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          AbsorbPointer(
                                            child: TextFormWdgt(
                                                controller: fRestNameCtrl,
                                                lable: const Text(
                                                    " Food Resturant"),
                                                validator: (value) {
                                                  if (value
                                                      .toString()
                                                      .isEmpty) {
                                                    return "الحقل لايجب ان يكون فارغ";
                                                  } else {
                                                    return null;
                                                  }
                                                }),
                                          ),
                                          AbsorbPointer(
                                            child: TextFormWdgt(
                                                controller: fCatNameCtrl,
                                                lable: const Text(
                                                    " Food Categort"),
                                                validator: (value) {
                                                  if (value
                                                      .toString()
                                                      .isEmpty) {
                                                    return "الحقل لايجب ان يكون فارغ";
                                                  } else {
                                                    return null;
                                                  }
                                                }),
                                          )
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
