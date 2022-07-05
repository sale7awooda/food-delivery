import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:orders/logic/controller/firestore_controller.dart';

import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int quantity = 0;
  final fstoreCtrl = Get.find<FirestoreController>();
  dynamic argumnts = Get.arguments;

  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    String ffoodImgURL = argumnts[3];
    String ffoodName = argumnts[1];
    String ffoodDetails = argumnts[2];
    String ffoodPrice = argumnts[4];
    String ffoodID = argumnts[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text(" FOOD DELIVERY"),
        centerTitle: true,
        //actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 10),
          Center(
              child: Stack(children: [
            ImageNetwork(
              image: ffoodImgURL,
              height: 250,
              width: 250,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.cover,
            )
          ])),
          const SizedBox(height: 20),
          TextUtils(
              text: ffoodName,
              fontsize: 20,
              fontweight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          const SizedBox(height: 20),
          FoodDetailsText(txtDetail: ffoodDetails),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add)),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity != 0) {
                          quantity--;
                        } else {}
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ),
          ButtonWdgt(text: "اضف للسلة", onPress: () {})
        ]),
      ),
    );
  }
}

class FoodDetailsText extends StatelessWidget {
  FoodDetailsText({Key? key, this.txtDetail}) : super(key: key);
  String? txtDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(20)),
            child: Text(textAlign: TextAlign.center, txtDetail!)
            // const Center(
            //     child: Text(
            //         textAlign: TextAlign.center,
            //         "food item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Details")),
            ));
  }
}
