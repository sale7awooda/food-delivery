import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/strings.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/auth/auth_buttun.dart';
import 'package:orders/veiw/widgets/auth/auth_text_form.dart';
import 'package:orders/veiw/widgets/auth/bottom_container.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(backgroundColor: lightGreyclr, elevation: 0),
            backgroundColor: lightGreyclr,
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 0),
                          child: Form(
                              key: formKey,
                              child: Column(children: [
                                Row(
                                  children: const [
                                    TextUtils(
                                        text: "تسجيل ",
                                        fontsize: 28,
                                        fontweight: FontWeight.bold,
                                        color: mainColor,
                                        underLine: TextDecoration.none),
                                    SizedBox(width: 3),
                                    TextUtils(
                                        text: "دخول",
                                        fontsize: 28,
                                        fontweight: FontWeight.bold,
                                        color: redClr,
                                        underLine: TextDecoration.none)
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                AuthTextForm(
                                    lable: const Text("البريد الإلكتروني"),
                                    controller: emailController,
                                    obscureText: false,
                                    validator: (value) {
                                      if (!RegExp(validationEmail)
                                          .hasMatch(value)) {
                                        return " بريد إلكتروني غير صالح";
                                      } else {
                                        return null;
                                      }
                                    },
                                    prefixIcon: Get.isDarkMode
                                        ? Image.asset("assets/images/email.png")
                                        : const Icon(Icons.email,
                                            color: mainColor, size: 30),
                                    suffixIcon: const Text("")),
                                //password
                                GetBuilder<AuthController>(builder: (_) {
                                  return AuthTextForm(
                                    lable: const Text("كلمه المرور"),
                                    controller: passwordController,
                                    obscureText:
                                        controller.isVisable ? false : true,
                                    validator: (value) {
                                      if (value.toString().length <= 6) {
                                        return "كلمه المرور يجب ان تكون اكثر من 6 حروف";
                                      } else {
                                        return null;
                                      }
                                    },
                                    // hintText: "كلمه المرور",
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: mainColor,
                                      size: 30,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.visibility();
                                        },
                                        icon: controller.isVisable
                                            ? const Icon(Icons.visibility_off,
                                                color: Colors.black)
                                            : const Icon(Icons.visibility,
                                                color: Colors.black)),
                                  );
                                }),
                                //Forgot Password
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.forgotpassScreen);
                                        },
                                        child: const TextUtils(
                                            text: "نسيت كلمه المرور!",
                                            fontsize: 16,
                                            fontweight: FontWeight.bold,
                                            color: mainColor,
                                            underLine: TextDecoration.none))),
                                const SizedBox(height: 20),
                                //auth button
                                GetBuilder<AuthController>(builder: (_) {
                                  return AuthButton(
                                      onPress: () {
                                        if (formKey.currentState!.validate()) {
                                          String emailAddress =
                                              emailController.text;
                                          String password =
                                              passwordController.text;
                                          controller.logInUsingEmail(
                                              emailAddress: emailAddress,
                                              password: password);
                                        }
                                      },
                                      text: "تسجيل دخول");
                                }),
                                const SizedBox(height: 20),
                                const TextUtils(
                                    text: "او",
                                    fontsize: 20,
                                    fontweight: FontWeight.bold,
                                    color: mainColor,
                                    underLine: TextDecoration.none),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GetBuilder<AuthController>(builder: (_) {
                                        return InkWell(
                                            onTap: () {
                                              controller.signUpUsingGoogle();
                                            },
                                            child: Image.asset(
                                                "images/google.png"));
                                      })
                                    ])
                              ])))),
                  BottomContainer(
                      onpress: () {
                        Get.offNamed(Routes.signUpScreen);
                      },
                      text: "ليس لديك حساب ؟",
                      texttype: "حساب جديد")
                ]))));
  }
}
