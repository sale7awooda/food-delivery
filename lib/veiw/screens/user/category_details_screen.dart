import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt2.dart';

import '../../../logic/controller/firestore_controller.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({
    Key? key,
    this.title,
    this.image,
    this.subtitle,
  }) : super(key: key);
  final String? title;
  final String? image;
  final String? subtitle;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  static String ffoodName = 'foodName';
  static String ffoodDetails = 'foodDetails';
  static String ffoodImgURL = 'foodImgUrl';
  static String ffoodCategID = 'foodCategortID';
  static String fResturantName ='restName';

  static String ffoodPrice1 = 'foodPrice';
  static String ffoodDetails1 = 'foodDetails';
  static String ffoodName1 = 'foodName';
  static String ffoodID1 = 'foodID';
  static String ffoodImgURL1 = 'foodImgUrl';
  //static String ffoodResturantID = 'foodResturantID';
  // ignore: unused_field
  static String ffoodID = 'foodID';
  static String ffoodPrice = 'foodPrice';
  //static String? fCategoryID=Get.arguments;
  var fCategoryID = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final fstoreCtrl = Get.find<FirestoreController>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          // actions: [
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          // ],
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            // const SearchBox(),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                  stream: fstoreCtrl.foodCol
                      .where(ffoodCategID, isEqualTo: fCategoryID)
                      // .where('restStatus', isEqualTo: true)
                      .snapshots(),
                  //initialData: initialData,
                  builder:
                      (BuildContext context, AsyncSnapshot streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return !streamSnapshot.hasData
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              //controller: scrollctrl,
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
                                          ffoodID = streamSnapshot
                                              .data!.docs[index].id;
                                          ffoodID1 = foodSnapshot.id;
                                          //streamSnapshot.data!.docs[index].id;
                                          ffoodName1 = foodSnapshot[ffoodName];
                                          ffoodImgURL1 =
                                              foodSnapshot[ffoodImgURL];
                                          ffoodDetails1 =
                                              foodSnapshot[ffoodDetails];
                                          ffoodPrice1 = foodSnapshot[ffoodPrice]
                                              .toString();
                                          //print(ffoodID);
                                        });
                                        Get.toNamed(Routes.fooddetails,
                                            arguments: [
                                              ffoodID1,
                                              ffoodName1,
                                              ffoodDetails1,
                                              ffoodImgURL1,
                                              ffoodPrice1
                                            ]);
                                      },
                                      child: ResurantWdgt2(
                                        title: streamSnapshot.data!.docs[index]
                                            [ffoodName],
                                        subtitle: streamSnapshot
                                            .data!.docs[index][fResturantName],
                                        imgUrl: streamSnapshot.data!.docs[index]
                                            [ffoodImgURL],
                                        price: streamSnapshot.data!.docs[index]
                                            [ffoodPrice].toString(),
                                      ),
                                    ));
                              });
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )

            //Expanded(child: CategoryFoodList()),
          ],
        ));
  }
}
