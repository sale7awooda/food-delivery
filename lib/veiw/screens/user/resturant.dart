import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/routes/routes.dart';

import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt.dart';

class ResturantScreen extends StatefulWidget {
  const ResturantScreen({
    Key? key,
    this.title,
    this.image,
    this.subtitle,
  }) : super(key: key);
  final String? title;
  final String? image;
  final String? subtitle;

  @override
  State<ResturantScreen> createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  final fstoreCtrl = Get.find<FirestoreController>();
  final scrollctrl = ScrollController();
  static String fResturantName = 'restName';
  static String fResturantDetails = 'restDetail';
  static String fResturantImg = 'restImg';
  var fResturantID = Get.arguments;
  //static String ffoodResturantID = 'foodResturantID';

  static String ffoodName = 'foodName';
  static String ffoodDetails = 'foodDetails';
  static String ffoodImgURL = 'foodImgUrl';
  static String ffoodCategID = 'foodCategortID';
  static String ffoodPrice1 = 'foodPrice';
  static String ffoodDetails1 = 'foodDetails';
  static String ffoodName1 = 'foodName';
  static String ffoodID1 = 'foodID';
  static String ffoodImgURL1 = 'foodImgUrl';
  //static String ffoodResturantID = 'foodResturantID';
  // ignore: unused_field
  static String ffoodID = 'foodID';
  static String ffoodPrice = 'foodPrice';

  //final List<ResturantModel> _loaddedResturants = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            // const SearchBox(),
            // const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                  stream: fstoreCtrl.foodCol
                      .where('foodResturantID', isEqualTo: fResturantID)
                      .snapshots(),
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
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ffoodID =
                                          streamSnapshot.data!.docs[index].id;
                                      //print(fCategoryID);
                                      ffoodID1 =
                                          streamSnapshot.data!.docs[index].id;
                                      ffoodName1 = foodSnapshot[ffoodName];
                                      ffoodImgURL1 = foodSnapshot[ffoodImgURL];
                                      ffoodDetails1 =
                                          foodSnapshot[ffoodDetails];
                                      ffoodPrice1 =
                                          foodSnapshot[ffoodPrice].toString();
                                    });
                                    Get.toNamed(Routes.fooddetails, arguments: [
                                      ffoodID1,
                                      ffoodName1,
                                      ffoodDetails1,
                                      ffoodImgURL1,
                                      ffoodPrice1
                                    ]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ResurantWdgt(
                                      title: foodSnapshot[ffoodName],
                                      subtitle: foodSnapshot[ffoodDetails],
                                      imgUrl: foodSnapshot[ffoodImgURL],
                                    ),
                                  ),
                                );
                              });
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),

              // StreamBuilder(
              //     stream: fstoreCtrl.restaurantCol.snapshots(),
              //     //initialData: initialData,
              //     builder:
              //         (BuildContext context, AsyncSnapshot streamSnapshot) {
              //       if (streamSnapshot.hasData) {
              //         return !streamSnapshot.hasData
              //             ? const Center(child: CircularProgressIndicator())
              //             : ListView.builder(
              //                 scrollDirection: Axis.vertical,
              //                 controller: scrollctrl,
              //                 itemCount: streamSnapshot.data!.docs.length,
              //                 itemBuilder: (context, index) {
              //                   final DocumentSnapshot resturantSnapshot =
              //                       streamSnapshot.data!.docs[index];
              //                   return Padding(
              //                     padding: const EdgeInsets.all(10.0),
              //                     child: InkWell(
              //                       hoverColor: Colors.lightBlue[200],
              //                       onTap: () {},
              //                       child: ResurantWdgt(
              //                         title:
              //                             resturantSnapshot[fResturantName],
              //                         subtitle: resturantSnapshot[
              //                             fResturantDetails],
              //                       ),

              //                     ),
              //                   );
              //                 });
              //       }
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     })

              //         ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemCount: _loaddedResturants.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return ResurantWdgt(
              //       title: _loaddedResturants[index].rname!,
              //       subtitle: _loaddedResturants[index].rdetial!,
              //     );
              //   },
              // )
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
