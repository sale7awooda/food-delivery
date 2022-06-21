import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/resturant_wdgt.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';
import 'package:path/path.dart';

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
  //static String ffoodImgURL = 'foodImgUrl';
  static String ffoodCategID = 'foodCategortID';
  static String ffoodResturantID = 'foodResturantID';
  // ignore: unused_field
  static String ffoodID = 'foodID';
  static String ffoodPrice = 'foodPrice';
  static String ffoodTime = 'foodTime';
  static String ffoodStatus = 'foodStatus';

  final fnameCtrl = TextEditingController();
  final fCatIdCtrl = TextEditingController();
  final fImageCtrl = TextEditingController();
  final fDetailsCtrl = TextEditingController();
  final fRestIdCtrl = TextEditingController();
  final fStatusCtrl = TextEditingController();
  final fPriceCtrl = TextEditingController();
  final fTimeCtrl = TextEditingController();
  //String _rname,_rowner,rpass,rloc,rdetal;
  clear() {
    fnameCtrl.clear();
    fDetailsCtrl.clear();
    fCatIdCtrl.clear();
    fImageCtrl.clear();
    fPriceCtrl.clear();
    fRestIdCtrl.clear();
    fTimeCtrl.clear();
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
                        text: "قائمة الاطعمه",
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
                      stream: fstoreCtrl.foodCol.snapshots(),
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

                                          fDetailsCtrl.text =
                                              foodSnapshot[ffoodDetails];
                                          fCatIdCtrl.text =
                                              foodSnapshot[ffoodCategID];
                                          fRestIdCtrl.text =
                                              foodSnapshot[ffoodResturantID];

                                          fPriceCtrl.text =
                                              foodSnapshot[ffoodPrice]
                                                  .toString();
                                          fTimeCtrl.text =
                                              foodSnapshot[ffoodTime]
                                                  .toString();
                                          fStatusCtrl.text =
                                              foodSnapshot[ffoodStatus]
                                                  .toString();
                                        },
                                        child: ResurantWdgt(
                                          title: foodSnapshot[ffoodName],
                                          subtitle: foodSnapshot[ffoodDetails],
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
                              OutlinedButton(
                                  onPressed: () async {
                                    final fpicker = await FilePicker.platform
                                        .pickFiles(
                                            allowMultiple: false,
                                            type: FileType.custom,
                                            allowedExtensions: ['jpg, png']);

                                    if (fpicker == null) {
                                      Get.snackbar("Error", "No Image Was Selected !!!");
                                      
                                    }
                                    if (fpicker != null) {
                                      uploadImage(fpicker.files.first);
                                    }
                                  },
                                  child: const Text("upload")
                                  // _displayIMG()
                                  ),
                              ElevatedButton(
                                  onPressed: () {
                                    // StorageRepo().uploadImage(uImage)

                                    // DatabaseRepo().getItem(ffoodID);print(ffoodID);
                                  },
                                  child: const Text("press"))

                              // Form(
                              //     key: _formKey,
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //           horizontal: 10),
                              //       child: Center(
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.center,
                              //           children: [
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 IconButton(
                              //                     onPressed: () {},
                              //                     icon: const Icon(
                              //                       Icons.image_outlined,
                              //                       size: 20,
                              //                     )),
                              //                 SizedBox(
                              //                   width: 100,
                              //                   height: 100,
                              //                   child: Image.asset(
                              //                       "images/groceries.png"),
                              //                 ),
                              //               ],
                              //             ),
                              //             Padding(
                              //               padding:
                              //                   const EdgeInsets.only(top: 10),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.center,
                              //                 children: [
                              //                   TextButton(
                              //                     onPressed: () {
                              //                       //clear();
                              //                       if (_formKey.currentState!
                              //                           .validate()) {
                              //                         _formKey.currentState!
                              //                             .save();
                              //                         fstoreCtrl.addFood(
                              //                           FoodModel(
                              //                               foodName: fnameCtrl
                              //                                   .value.text,
                              //                               foodDetails: fDetailsCtrl
                              //                                   .value.text,
                              //                               foodCategID:
                              //                                   fCatIdCtrl
                              //                                       .value.text,
                              //                               foodImage: fimg,
                              //                               foodPrice: int.tryParse(fPriceCtrl.value.text),
                              //                               foodResturantID: fRestIdCtrl.value.text,
                              //                               foodTime: int.tryParse(fTimeCtrl.value.text),
                              //                               foodStatus:  fstatus
                              //                               // rimg:"images/groceries.png"
                              //                               ),
                              //                         );
                              //                         Get.snackbar("تنبية",
                              //                             "تم الحفظ بنجاااح",
                              //                             maxWidth: 400,
                              //                             snackPosition:
                              //                                 SnackPosition
                              //                                     .BOTTOM,
                              //                             isDismissible: true,
                              //                             duration:
                              //                                 const Duration(
                              //                                     seconds: 3));
                              //                         //clearCtrl();
                              //                       }
                              //                     },
                              //                     child: const TextUtils(
                              //                         text: "إضافة",
                              //                         fontsize: 20,
                              //                         fontweight:
                              //                             FontWeight.bold,
                              //                         color: mainColor,
                              //                         underLine:
                              //                             TextDecoration.none),
                              //                     // Icon(
                              //                     //   Icons.add,
                              //                     //   size: 35,
                              //                     //   color: mainColor,
                              //                     // )
                              //                     // ),
                              //                   ),
                              //                   TextButton(
                              //                     onPressed: () {
                              //                       Get.snackbar("حذف",
                              //                           "أنت على وشك حذف ملف , هل ترغب بالاستمرار",
                              //                           snackPosition:
                              //                               SnackPosition
                              //                                   .BOTTOM,
                              //                           isDismissible: true,
                              //                           maxWidth: 400,
                              //                           duration:
                              //                               const Duration(
                              //                                   seconds: 5),
                              //                           mainButton: TextButton(
                              //                               onPressed: () {
                              //                                 fstoreCtrl
                              //                                     .removeFood(
                              //                                         fID!);
                              //                                 clear();
                              //                               },
                              //                               child: const Text(
                              //                                   "نعم")));
                              //                     },
                              //                     child: const TextUtils(
                              //                         text: "حذف",
                              //                         fontsize: 20,
                              //                         fontweight:
                              //                             FontWeight.bold,
                              //                         color: mainColor,
                              //                         underLine:
                              //                             TextDecoration.none),
                              //                     // Icon(
                              //                     //     Icons.remove,
                              //                     //     size: 35,
                              //                     //     color: mainColor)
                              //                   ),
                              //                   TextButton(
                              //                     onPressed: () {
                              //                       if (_formKey.currentState!
                              //                           .validate()) {
                              //                         _formKey.currentState!
                              //                             .save();
                              //                         fstoreCtrl.updateFood(
                              //                           fID!,
                              //                           FoodModel(
                              //                               foodName: fnameCtrl
                              //                                   .value.text,
                              //                               foodDetails: fDetailsCtrl
                              //                                   .value.text,
                              //                               foodCategID:
                              //                                   fCatIdCtrl
                              //                                       .value.text,
                              //                               foodImage: fimg,
                              //                               foodPrice: int.tryParse(fPriceCtrl.value.text),
                              //                               foodResturantID: fRestIdCtrl.value.text,
                              //                               foodTime: int.tryParse(fTimeCtrl.value.text),
                              //                               foodStatus:  fstatus
                              //                               // rimg:"images/groceries.png"
                              //                               ),
                              //                         );
                              //                         Get.snackbar("تعديل",
                              //                             "تم التعديل بنجاااح",
                              //                             maxWidth: 400,
                              //                             snackPosition:
                              //                                 SnackPosition
                              //                                     .BOTTOM,
                              //                             isDismissible: true,
                              //                             duration:
                              //                                 const Duration(
                              //                                     seconds: 3));
                              //                       }
                              //                     },
                              //                     child: const TextUtils(
                              //                         text: "تعديل",
                              //                         fontsize: 20,
                              //                         fontweight:
                              //                             FontWeight.bold,
                              //                         color: mainColor,
                              //                         underLine:
                              //                             TextDecoration.none),
                              //                     // Icon(
                              //                     //     Icons.update,
                              //                     //     size: 35,
                              //                     //     color: mainColor)
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             TextFormWdgt(
                              //               controller: fnameCtrl,
                              //               lable: const Text("اسم الطعام  "),
                              //               validator: (value) {
                              //                 if (value.toString().isEmpty) {
                              //                   return "الحقل لايجب ان يكون فارغ";
                              //                 } else {
                              //                   return null;
                              //                 }
                              //               },
                              //             ),
                              //             TextFormWdgt(
                              //                 controller: fCatIdCtrl,
                              //                 lable: const Text(" الصنف "),
                              //                 // hint: "عباره عن رقم فريد",
                              //                 validator: (value) {
                              //                   if (value.toString().isEmpty) {
                              //                     return "الحقل لايجب ان يكون فارغ";
                              //                   } else {
                              //                     return null;
                              //                   }
                              //                 }),
                              //             TextFormWdgt(
                              //                 controller: fDetailsCtrl,
                              //                 lable:
                              //                     const Text(" تفاصيل الطعام "),
                              //                 validator: (value) {
                              //                   if (value.toString().isEmpty) {
                              //                     return "الحقل لايجب ان يكون فارغ";
                              //                   } else {
                              //                     return null;
                              //                   }
                              //                 }),
                              //                 TextFormWdgt(
                              //                 controller: fRestIdCtrl,
                              //                 lable:
                              //                     const Text(" المطعم "),
                              //                 validator: (value) {
                              //                   if (value.toString().isEmpty) {
                              //                     return "الحقل لايجب ان يكون فارغ";
                              //                   } else {
                              //                     return null;
                              //                   }
                              //                 }),
                              //                 TextFormWdgt(
                              //                 controller: fPriceCtrl,
                              //                 lable:
                              //                     const Text(" السعر "),
                              //                 validator: (value) {
                              //                   if (value.toString().isEmpty) {
                              //                     return "الحقل لايجب ان يكون فارغ";
                              //                   } else {
                              //                     return null;
                              //                   }
                              //                 }),TextFormWdgt(
                              //                 controller: fTimeCtrl,
                              //                 lable:
                              //                     const Text(" الزمن اللازم "),
                              //                 validator: (value) {
                              //                   if (value.toString().isEmpty) {
                              //                     return "الحقل لايجب ان يكون فارغ";
                              //                   } else {
                              //                     return null;
                              //                   }
                              //                 }),
                              //                 // TextFormWdgt(
                              //                 // controller: fStatusCtrl,
                              //                 // lable:
                              //                 //     const Text(" متوفر "),
                              //                 // validator: (value) {
                              //                 //   if (value.toString().isEmpty) {
                              //                 //     return "الحقل لايجب ان يكون فارغ";
                              //                 //   } else {
                              //                 //     return null;
                              //                 //   }
                              //                 // }),
                              //           ],
                              //         ),
                              //       ),
                              //     )
                              //     )
                            ],
                          ),
                        )
                      ],
                    ))
                  ]))
        ]);
  }


  Future<String> uploadImage(PlatformFile file) async {
    try {
      TaskSnapshot upload =
          await FirebaseStorage.instance.ref(file.name).putData(
                file.bytes!,
                SettableMetadata(contentType: 'image/${file.extension}'),
              );

      String url = await upload.ref.getDownloadURL();
      
      print(url);
      
      return url;
    } catch (e) {
       Get.snackbar("Error",e.toString());
      return '';
    }
  }
}
