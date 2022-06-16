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

  List<ResturantModel> _loaddedResturants = [];

  String name = '';
  String owner = '';
  String pass = '';
  String email = '';
  String loc = '';
  String detail = '';
  String img = 'images/groceries.png';

  final rnameCtrl = TextEditingController();
  final rOwnerCtrl = TextEditingController();
  final rPassCtrl = TextEditingController();
  final rLocationCtrl = TextEditingController();
  final rImageCtrl = TextEditingController();
  final rDetailsCtrl = TextEditingController();
  //String _rname,_rowner,rpass,rloc,rdetal;
  @override
  void initState() {
    super.initState();
    getResturants();
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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: scrollctrl,
                  itemCount: _loaddedResturants.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ResurantWdgt(
                              title: _loaddedResturants[index].rname!,
                              subtitle: _loaddedResturants[index].rdetial!,
                            )

                            // ButtonWdgt(
                            //     text: _loaddedResturants[index].rname!,
                            //     onPress: () {}),
                            ));
                  },
                ),
              ),
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
                              setState(() {
                                clearCtrl();
                              });
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
                            onPressed: () {},
                            icon: const Icon(Icons.remove,
                                size: 35, color: mainColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                getResturants();
                              });
                            },
                            icon: const Icon(Icons.refresh,
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
                          scrollDirection: Axis.vertical, shrinkWrap: true,
                          controller: ScrollController(),
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                TextButton(
                                                    onPressed: () {
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
                                                            // rimg:"images/groceries.png"
                                                          ),
                                                        );
                                                        //clearCtrl();
                                                        setState(() {
                                                          getResturants();
                                                        });
                                                      }
                                                    },
                                                    child: const TextUtils(
                                                        text: "حفظ",
                                                        fontsize: 25,
                                                        fontweight:
                                                            FontWeight.normal,
                                                        color: mainColor,
                                                        underLine:
                                                            TextDecoration
                                                                .none)),
                                                const SizedBox(height: 20),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: const TextUtils(
                                                        text: "إلغاء",
                                                        fontsize: 25,
                                                        fontweight:
                                                            FontWeight.normal,
                                                        color: mainColor,
                                                        underLine:
                                                            TextDecoration
                                                                .none)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: Image.asset(
                                                  "images/groceries.png"),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.image_outlined,
                                                  size: 20,
                                                ))
                                          ],
                                        ),
                                        TextFormWdgt(
                                          controller: rnameCtrl,
                                          lable: const Text("Resturant Name "),
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
                                            lable:
                                                const Text("Resturant Owner "),
                                            validator: (value) {
                                              if (value.toString().isEmpty) {
                                                return "الحقل لايجب ان يكون فارغ";
                                              } else {
                                                return null;
                                              }
                                            }),
                                        TextFormWdgt(
                                            controller: rPassCtrl,
                                            lable:
                                                const Text(" Owner Password "),
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
            ],
          ),
        )
      ],
    );
  }

  clearCtrl() {
    rnameCtrl.clear();
    rOwnerCtrl.clear();
    rPassCtrl.clear();
    rLocationCtrl.clear();
    rImageCtrl.clear();
    rDetailsCtrl.clear();
  }

  void getResturants() async {
    _loaddedResturants = await fstoreCtrl.loadResturants();
  }
}
