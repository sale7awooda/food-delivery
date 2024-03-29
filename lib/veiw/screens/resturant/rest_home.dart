import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/resturant_model.dart';
import 'package:orders/utils/theme.dart';

// import 'package:orders/veiw/widgets/user/category_list.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class RestHomeScreen extends StatefulWidget {
  const RestHomeScreen({Key? key}) : super(key: key);

  @override
  State<RestHomeScreen> createState() => _RestHomeScreenState();
}

class _RestHomeScreenState extends State<RestHomeScreen> {
  final fstoreCtrl = Get.find<FirestoreController>();
  final scrollctrl = ScrollController();
  // static String frestName = 'catName';
  // static String frestImg = 'catImg';
  // static String? frestID;
  var arguments = Get.arguments;
  int counter = 0;
  bool switchVal = true;

  @override
  Widget build(BuildContext context) {
    // bool switchVal = arguments[3];
    // String rstat = arguments[3];
    // List<dynamic> items = [];
    // switch (arguments[3]) {
    //   case true:
    //     switchVal = false;
    //     break;
    //   case false:
    //     switchVal = true;
    //     break;
    //   default:
    // }

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          StreamBuilder(
              stream: fstoreCtrl.restaurantCol
                  .where('foodResturantID', isEqualTo: fstoreCtrl.restID)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return !streamSnapshot.hasData
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          //controller: scrollctrl,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot restSnapshot =
                                streamSnapshot.data!.docs[index];
                            setState(() {
                              switchVal = restSnapshot['restStatus'];
                            });
                            return Container();
                          });
                }
                return Center(child: Container());
              }),
          const SizedBox(height: 75),
          Center(
              child: TextUtils(
                  text: arguments[1],
                  fontsize: 30,
                  fontweight: FontWeight.bold,
                  color: mainColor,
                  underLine: TextDecoration.none)),
          const SizedBox(height: 20),
          SizedBox(
              height: 300,
              width: 300,
              child: CachedNetworkImage(
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.clear,
                  imageUrl: arguments[2],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 125, color: Colors.red))),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const TextUtils(
                text: "حاله المطعم ",
                fontsize: 25,
                fontweight: FontWeight.bold,
                color: mainColor,
                underLine: TextDecoration.none),
            Switch(
                value: switchVal,
                onChanged: (bool value) {
                  setState(() {
                    switchVal = value;
                    fstoreCtrl.updateResturant(
                        arguments[4],
                        ResturantModel(
                            rname: arguments[1],
                            rowner: arguments[7],
                            rStatus: switchVal,
                            rloc: arguments[5],
                            rdetial: arguments[6],
                            rimgURL: arguments[2]));
                  });
                })
          ]),
          const SizedBox(height: 20)
        ])));
  }
}
