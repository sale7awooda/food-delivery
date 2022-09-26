import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orders/logic/controller/app_controller.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/auth/auth_buttun.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

import '../../../logic/controller/auth_controller.dart';

class RestSettingsScreen extends StatefulWidget {
  const RestSettingsScreen({Key? key}) : super(key: key);

  @override
  State<RestSettingsScreen> createState() => _RestSettingsScreenState();
}

class _RestSettingsScreenState extends State<RestSettingsScreen> {
  // List<DocumentSnapshot> allordreslist = [];
  // List<DocumentSnapshot> allOKordreslist = [];

  var totSales = 0;
  var okCount = 0;
  var allCount = 0;

  // stores fetched products
  // bool isLoading = false; // track if products fetching
  // bool hasMore = true; // flag for more products available or not
  // int documentLimit = 20; // documents to be fetched per request
  DocumentSnapshot?
      lastDocument; // flag for last document from where next 10 records to be fetched
  //final ScrollController _scrollController = ScrollController();
  final authCtrl = Get.find<AuthController>();
  final fstoreCtrl = Get.find<FirestoreController>();
  final controller = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
    getallOKordersList();
    getallordersList();
  }

  @override
  Widget build(BuildContext context) {
    // _scrollController.addListener(() {
    //   double maxScroll = _scrollController.position.maxScrollExtent;
    //   double currentScroll = _scrollController.position.pixels;
    //   double delta = MediaQuery.of(context).size.height * 0.20;
    //   if (maxScroll - currentScroll <= delta) {
    //     getFoodsList();
    //   }
    // });
    //var allorders = allordreslist.length;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: ValueKey(controller.selectedIndexResturant),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 30),
              const TextUtils(
                  text: "تقارير المطعم",
                  fontsize: 35,
                  fontweight: FontWeight.bold,
                  color: mainColor,
                  underLine: TextDecoration.none),
              Card(
                elevation: 5,
                shadowColor: Colors.black38,
                margin: const EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TextUtils(
                          text: " مجموع الطلبات ",
                          fontsize: 30,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none),
                      TextUtils(
                          text: allCount.toString(),
                          fontsize: 25,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none)
                    ]),
              ),

              Card(
                elevation: 5,
                shadowColor: Colors.black38,
                margin: const EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TextUtils(
                          text: "الطلبات المقبولة",
                          fontsize: 30,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none),
                      TextUtils(
                          text: okCount.toString(),
                          fontsize: 25,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none)
                    ]),
              ),
              // const SizedBox(height: 30),
              Card(
                elevation: 5,
                shadowColor: Colors.black38,
                margin: const EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TextUtils(
                          text: "مبيعات المطعم",
                          fontsize: 30,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none),
                      TextUtils(
                          text: totSales.toString(),
                          fontsize: 25,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none)
                    ]),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              IconButton(
                  onPressed: () {
                    getallordersList();
                    getallOKordersList();

                    showToastWidget(
                        Container(
                          color: Colors.black.withOpacity(0.8),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: LoadingAnimationWidget.dotsTriangle(
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        position: ToastPosition.center,
                        duration: const Duration(seconds: 5), onDismiss: () {
                      setState(() {});
                    });
                    // dismissAllToast();
                  },
                  icon: const Icon(
                    Icons.refresh_outlined,
                    size: 50,
                    color: mainColor,
                  )),
              const SizedBox(height: 30),
              AuthButton(
                  text: "تسجيل خروج",
                  onPress: () {
                    authCtrl.signOut();
                  }),
            ],
          ),
        ));
  }

  getallOKordersList() {
    //QuerySnapshot querySnapshot;
    fstoreCtrl.orderCol
        .where('foodResturantID', isEqualTo: fstoreCtrl.restID)
        .where('ostatus', isEqualTo: "true")
        .get()
        .then((querySnapshot) {
      // setState(() {
      okCount = querySnapshot.docs.length;
      // });
      num snaps = 0;
      for (var snapshot in querySnapshot.docs) {
        snaps += snapshot.get('oTotalPrice');
        totSales = snaps.toInt();
      }
      return totSales;
    });
    // print(totSales);
    // print(okCount);
    // allOKordreslist.addAll(querySnapshot);
  }

  getallordersList() async {
    await fstoreCtrl.orderCol
        .where('foodResturantID', isEqualTo: fstoreCtrl.restID)
        .get()
        .then((querySnapshot) {
      allCount = querySnapshot.docs.length;
      return allCount;
    });
    //     .then((querySnapshot) {

    //   for (var snapshot in querySnapshot.docs) {
    //      pTotal += int.tryParse(snapshot.get('oTotalPrice'))!;

    //   }

    // });
    // allordreslist.addAll(querySnapshot.docs);
  }
}
