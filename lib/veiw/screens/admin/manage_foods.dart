// ignore_for_file: unused_field

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';
// import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt2.dart';
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
  bool picIsLoaded = false;

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
    fCatNameCtrl.clear();
    picIsLoaded = false;
  }

  List<DocumentSnapshot> foodsList = []; // stores fetched products
  bool isLoading = false; // track if products fetching
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 20; // documents to be fetched per request
  DocumentSnapshot?
      lastDocument; // flag for last document from where next 10 records to be fetched
  final ScrollController _scrollController =
      ScrollController(); // listener for listview scrolling

  final _random = Random();
  String fImagePreview = '';

  @override
  void initState() {
    super.initState();
    getFoodsList();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        getFoodsList();
      }
    });
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
                  child: Column(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  // (foodsList.isEmpty)
                                  //     ? const Center(
                                  //         child: CircularProgressIndicator(),
                                  //       )
                                  StreamBuilder(
                                      stream: fstoreCtrl.foodCol.snapshots(),
                                      //initialData: initialData,
                                      builder: (BuildContext context,
                                          AsyncSnapshot streamSnapshot) {
                                        if (streamSnapshot.hasData) {
                                          return !streamSnapshot.hasData
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  controller: _scrollController,
                                                  itemCount: streamSnapshot
                                                      .data!.docs.length,
                                                  //foodsList.length,

                                                  itemBuilder:
                                                      (context, index) {
                                                    final DocumentSnapshot
                                                        foodsSnapshot =
                                                        streamSnapshot
                                                            .data!.docs[index];
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          fID = foodsSnapshot;
                                                          ffoodID =
                                                              streamSnapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id;
                                                          fImagePreview =
                                                              foodsSnapshot[
                                                                  ffoodImgURL];
                                                          fidCtrl.text =
                                                              ffoodID;
                                                        });
                                                        //print(ffoodID);

                                                        fnameCtrl.text =
                                                            foodsSnapshot[
                                                                ffoodName];

                                                        // streamSnapshot
                                                        //     .data!.docs[index].id;

                                                        fDetailsCtrl.text =
                                                            foodsSnapshot[
                                                                ffoodDetails];
                                                        cIDCtrl.text =
                                                            foodsSnapshot[
                                                                ffoodCategID];
                                                        rIDCtrl.text =
                                                            foodsSnapshot[
                                                                ffoodResturantID];
                                                        fRestNameCtrl.text =
                                                            foodsSnapshot[
                                                                fResturantName];
                                                        fCatNameCtrl.text =
                                                            foodsSnapshot[
                                                                fCategoryName];
                                                        fImageCtrl.text =
                                                            foodsSnapshot[
                                                                ffoodImgURL];

                                                        fPriceCtrl.text =
                                                            foodsSnapshot[
                                                                    ffoodPrice]
                                                                .toString();
                                                      },
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: Container(
                                                              //height: 200,width: 250,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                      //maxHeight: 150,
                                                                      ),
                                                              color: Colors
                                                                      .primaries[
                                                                  _random.nextInt(
                                                                      Colors
                                                                          .primaries
                                                                          .length)][_random
                                                                      .nextInt(
                                                                          9) *
                                                                  100],

                                                              child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center, //fit: StackFit.loose,
                                                                  children: [
                                                                    ListTile(
                                                                      contentPadding:
                                                                          const EdgeInsets.all(
                                                                              20),
                                                                      title: Text(
                                                                          foodsSnapshot[
                                                                              ffoodName],
                                                                          style: const TextStyle(
                                                                              color: mainColor,
                                                                              fontWeight: FontWeight.bold)),
                                                                      subtitle: Text(
                                                                          foodsSnapshot[
                                                                              ffoodDetails],
                                                                          style:
                                                                              const TextStyle(color: Colors.white)),
                                                                    )
                                                                  ]),
                                                            ),
                                                          )),
                                                    );
                                                  },
                                                );
                                        }
                                        return Container();
                                      }))),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Card(
                            color: lightGreyclr,
                            child: AbsorbPointer(
                              child: ImageNetwork(
                                key: ValueKey(fImagePreview),
                                image: fImagePreview,
                                imageCache:
                                    CachedNetworkImageProvider(fImagePreview),
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
                      ),
                      isLoading
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(8),
                              color: const Color.fromARGB(255, 119, 167, 250),
                              child: const Text(
                                'جاااري التحميل...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),

                  // StreamBuilder(
                  //     stream: fstoreCtrl.foodCol.snapshots(),
                  //     //initialData: initialData,
                  //     builder: (BuildContext context,
                  //         AsyncSnapshot streamSnapshot) {
                  //       if (streamSnapshot.hasData) {
                  //         return !streamSnapshot.hasData
                  //             ? const Center(
                  //                 child: CircularProgressIndicator())
                  //             : ListView.builder(
                  //                 scrollDirection: Axis.vertical,
                  //                 controller: scrollctrl,
                  //                 itemCount: streamSnapshot.data!.docs.length,
                  //                 itemBuilder: (context, index) {
                  //                   final DocumentSnapshot foodSnapshot =
                  //                       streamSnapshot.data!.docs[index];
                  //                   return Padding(
                  //                       padding: const EdgeInsets.all(10.0),
                  //                       child: InkWell(
                  //                         hoverColor: Colors.lightBlue[200],
                  //                         onTap: () {
                  //                           setState(() {
                  //                             fID = foodSnapshot;
                  //                             ffoodID = streamSnapshot
                  //                                 .data!.docs[index].id;
                  //                           });

                  //                           fnameCtrl.text =
                  //                               foodSnapshot[ffoodName];
                  //                           fidCtrl.text = ffoodID;
                  //                           // streamSnapshot
                  //                           //     .data!.docs[index].id;

                  //                           fDetailsCtrl.text =
                  //                               foodSnapshot[ffoodDetails];
                  //                           cIDCtrl.text =
                  //                               foodSnapshot[ffoodCategID];
                  //                           rIDCtrl.text = foodSnapshot[
                  //                               ffoodResturantID];
                  //                           fRestNameCtrl.text =
                  //                               foodSnapshot[fResturantName];
                  //                           fCatNameCtrl.text =
                  //                               foodSnapshot[fCategoryName];
                  //                           fImageCtrl.text =
                  //                               foodSnapshot[fCategoryName];

                  //                           fPriceCtrl.text =
                  //                               foodSnapshot[ffoodPrice]
                  //                                   .toString();
                  //                           fImageCtrl.text =
                  //                               foodSnapshot[ffoodImgURL];
                  //                         },
                  //                         child: ResurantWdgt3(
                  //                           title: foodSnapshot[ffoodName],
                  //                           subtitle:
                  //                               foodSnapshot[ffoodDetails],
                  //                           imgUrl: foodSnapshot[ffoodImgURL],
                  //                         ),
                  //                       ));
                  //                 });
                  //       }
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }),
                ),

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
                                        text: "المطعم",
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
                                        text: "الصنف",
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
                                                width: 15,
                                              ),
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
                                                          "لم يتم اختيار صورة !!!");
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
                                                            fImageCtrl.text =
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
                                                                fImageCtrl
                                                                    .value.text,
                                                            foodID: fidCtrl
                                                                .value.text,
                                                            foodName: fnameCtrl
                                                                .value.text,
                                                            foodDetails:
                                                                fDetailsCtrl
                                                                    .value.text,
                                                            foodCategID: cIDCtrl
                                                                .value.text,
                                                            foodPrice:
                                                                int.tryParse(
                                                                    fPriceCtrl
                                                                        .value
                                                                        .text),
                                                            foodResturantID:
                                                                rIDCtrl
                                                                    .value.text,
                                                            fResturantName:
                                                                fRestNameCtrl
                                                                    .value.text,
                                                            fCategoryName:
                                                                fCatNameCtrl
                                                                    .value.text,
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
                                              lable: const Text("صوره الطعام "),
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
                                            controller: fnameCtrl,
                                            lable: const Text("اسم الطعام "),
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
                                                  const Text("تفاصيل الطعام "),
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "الحقل لايجب ان يكون فارغ";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                          TextFormWdgt(
                                              controller: fPriceCtrl,
                                              lable: const Text("سعر الطعام "),
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
                                                    " المطعم البائع"),
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
                                                    " الصنف"),
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

  getFoodsList() async {
    if (!hasMore) {
      // print('No More Products');
      return;
    }
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await fstoreCtrl.foodCol
          .orderBy(ffoodName)
          .limit(documentLimit)
          .get();
    } else {
      querySnapshot = await fstoreCtrl.foodCol
          .orderBy(ffoodName)
          .startAfterDocument(lastDocument!)
          .limit(documentLimit)
          .get();
      // print(1);
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    foodsList.addAll(querySnapshot.docs);
    setState(() {
      isLoading = false;
    });
  }
}
