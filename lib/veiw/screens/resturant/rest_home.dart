import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
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
  RxInt counter = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                child: ImageNetwork(
                  image: arguments[2],
                  height: 250,
                  width: 250,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover,
                )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextUtils(
                    text: "عداد الطلبات ",
                    fontsize: 25,
                    fontweight: FontWeight.bold,
                    color: mainColor,
                    underLine: TextDecoration.none),
                TextUtils(
                    text: fstoreCtrl.ordersCount.toString(),
                    fontsize: 25,
                    fontweight: FontWeight.bold,
                    color: mainColor,
                    underLine: TextDecoration.none)
              ],
            ),
            const SizedBox(height: 20),
          ]),
    ));
  }
}
