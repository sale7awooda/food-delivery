import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/responsive.dart';

import 'routes/routes.dart';
import 'utils/theme.dart';
import 'veiw/widgets/user/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("images/backpic.jpg", fit: BoxFit.scaleDown),
          ),
          SizedBox(
            // color: Colors.black.withOpacity(.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                        //color: Colors.black.withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child:  Center(
                      child: !Responsive.isDesktop(context)? null:const Text(
                        "مرحبا",
                        style: TextStyle(
                            fontSize: 30,
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    )),
                const SizedBox(height: 300),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {
                      //Get.offNamed(Routes.adminScreen);
                      Get.offAllNamed(Routes.signInScreen);
                    },
                    child: const TextUtils(
                        text: "إبدأ",
                        fontsize: 24,
                        fontweight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const TextUtils(
                        text: "ليس لديك حساب؟",
                        fontsize: 20,
                        fontweight: FontWeight.normal,
                        color: mainColor,
                        underLine: TextDecoration.none),
                        TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signUpScreen);
                      },
                      child: const TextUtils(
                        text: "مستخدم جديد",
                        fontsize: 20,
                        fontweight: FontWeight.bold,
                        color: mainColor,
                        underLine: TextDecoration.underline,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
