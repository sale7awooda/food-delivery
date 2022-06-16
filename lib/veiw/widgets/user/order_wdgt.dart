import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';




class OrderWdgt extends StatelessWidget {
  const OrderWdgt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.fooddetails);
      },
      child: Container(
        width: 250,
        height: 200,
        //padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: lightGreyclr, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "images/groceries.png", //height: 130,
              //fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black38),
                  width: 250,
                  height: 70,
                  child: const Center(
                      child: TextUtils(
                          text: "نص عشوائي",
                          fontsize: 25,
                          fontweight: FontWeight.bold,
                          color: mainColor,
                          underLine: TextDecoration.none))),
            )
          ],
        ),
      ),
    );
  }
}
