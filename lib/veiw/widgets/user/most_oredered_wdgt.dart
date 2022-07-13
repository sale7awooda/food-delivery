

// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/routes/routes.dart';

import 'order_wdgt.dart';

class MostOrderedWdgt extends StatefulWidget {
  const MostOrderedWdgt({
    Key? key,
  }) : super(key: key);

  @override
  State<MostOrderedWdgt> createState() => _MostOrderedWdgtState();
}

class _MostOrderedWdgtState extends State<MostOrderedWdgt> {
  static String ffoodPrice1 = 'foodPrice';
  static String ffoodDetails1 = 'foodDetails';
  static String ffoodName1 = 'foodName';
  static String ffoodID1 = 'foodID';
  static String ffoodImgURL1 = 'foodImgUrl';
  static String ffoodName = 'foodName';
  static String ffoodID = 'foodID';
  static String ffoodImgURL = 'foodImgUrl';
  static String ffoodPrice = 'foodPrice';
  static String ffoodDetails = 'foodDetails';

 

  final fstoreCtrl = Get.find<FirestoreController>();
  DocumentSnapshot? fID;
  //final _random = Random();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: StreamBuilder(
            stream: fstoreCtrl.foodCol.snapshots(),
            //initialData: initialData,
            builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
              if (streamSnapshot.hasData) {
                return !streamSnapshot.hasData
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //controller: scrollctrl,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot foodSnapshot =
                              streamSnapshot.data!.docs[index];

                          return InkWell(
                              onTap: () {
                                setState(() {
                                 // fID = foodSnapshot;
                                  ffoodID1 = streamSnapshot.data!.docs[index].id;
                                  ffoodName1 = foodSnapshot[ffoodName];
                                  ffoodImgURL1 = foodSnapshot[ffoodImgURL];
                                  ffoodDetails1 = foodSnapshot[ffoodDetails];
                                  ffoodPrice1 = foodSnapshot[ffoodPrice].toString();
                                });
                                Get.toNamed(
                                  Routes.fooddetails,
                                   arguments: [
                                    ffoodID1,
                                    ffoodName1,
                                    ffoodDetails1,
                                    ffoodImgURL1,
                                    ffoodPrice1
                                  ]
                                );
                              },
                              child: OrderWdgt(
                                text: foodSnapshot[ffoodName],
                                imgUrl: streamSnapshot.data!.docs[index]
                                    [ffoodImgURL],
                                price: streamSnapshot.data!.docs[index]
                                    [ffoodPrice].toString(),
                              )
                              //OrderWdgt( title: streamSnapshot.data!.docs[index][ffoodName],imgUrl: streamSnapshot.data!.docs[index][ffoodImgURL],),
                              );
                        });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
