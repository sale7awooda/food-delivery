import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/strings.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/auth/auth_buttun.dart';
import 'package:orders/veiw/widgets/auth/auth_text_form.dart';
import 'package:orders/veiw/widgets/auth/bottom_container.dart';
import 'package:orders/veiw/widgets/auth/check_box_widget.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //  final controller = Get.put(AuthController());
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: lightGreyclr,
          elevation: 0),
      backgroundColor: lightGreyclr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: const[
                           TextUtils(
                              text: "تسجيل",
                              fontsize: 28,
                              fontweight: FontWeight.bold,
                              color: mainColor,
                              underLine: TextDecoration.none),
                           SizedBox(width: 3),
                          TextUtils(
                              text: "حساب",
                              fontsize: 28,
                              fontweight: FontWeight.bold,
                              color:
                                  redClr,
                              underLine: TextDecoration.none)
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //username
                      AuthTextForm(
                        lable: const Text("اسم المستخدم"),
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return "ادخل اسم مستخدم صالح";
                          } else {
                            return null;
                          }
                        },
                        //hintText: "اسم المستخدم",
                        prefixIcon: const Icon(
                                Icons.person,
                                color: mainColor,
                                size: 30,
                              ),
                        suffixIcon: const Text(""),
                      ),
                      //email
                      AuthTextForm(
                        lable: const Text("البريد الإلكتروني"),
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return "  بريدإلكتروني غير صالح";
                          } else {
                            return null;
                          }
                        },
                       // hintText: "البريد الإلكتروني",
                        prefixIcon: const Icon(
                                Icons.email,
                                color: mainColor,
                                size: 30,
                              ),
                        suffixIcon: const Text(""),
                      ),
                      //password
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextForm(
                          lable: const Text("كلمه المرور"),
                          controller: passwordController,
                          obscureText: controller.isVisable ? false : true,
                          validator: (value) {
                            if (value.toString().length <= 6) {
                              return "كلمه المرور يجب ان تكون اكثر من 6 حروف";
                            } else {
                              return null;
                            }
                          },
                          //hintText: "كلمه المرور",
                          prefixIcon:const Icon(
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
                      const SizedBox(
                        height: 30,
                      ),
                      CheckBoxWidget(),
                      const SizedBox(height: 40),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPress: () {
                            if (controller.ischecked == false) {
                              String message = "يجب الموافقه على الشروط والاتفاقيات";
                              Get.snackbar(
                                "خطأ !",
                                message,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red[200],
                                messageText: TextUtils(
                                    text: message,
                                    fontsize: 20,
                                    fontweight: FontWeight.bold,
                                    color: Colors.black,
                                    underLine: TextDecoration.none),
                              );
                            } else if (formKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              String userName = nameController.text.trim();

                              controller.signUpUsingEmail(
                                  emailAddress: email,
                                  password: password,
                                  userName: userName);
                              controller.ischecked == true;
                            }
                          },
                          text: "تسجيل حساب",
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            BottomContainer(
                onpress: () {
                  Get.offAllNamed(Routes.signInScreen);
                },
                text: "لدي حساب بالفعل؟",
                texttype: "تسجيل "),
          ],
        ),
      ),
    ));
  }
}
