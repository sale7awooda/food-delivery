import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController{
bool isVisable = false;
  bool ischecked = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSign = GoogleSignIn();
  String? displayUsername = "";
  var displayUserPhoto = "";
  var adminEmail="";

  void visibility() {
    isVisable = !isVisable;
    update();
  }

  void checkBoxVisibility() {
    ischecked = !ischecked;
    update();
  }

  void signUpUsingEmail(
      {required String emailAddress,
      required String password,
      required String userName}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        displayUsername = userName;
        auth.currentUser!.updateDisplayName(userName);
      });
      update();
      Get.offNamed(Routes.userScreen);
    } on FirebaseAuthException catch (e) {
      String message = "";
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      if (e.code == 'weak-password') {
        message = 'كلمه المرور ضعيفه ';
      } else if (e.code == 'email-already-in-use') {
        message = "البريد الإلكتروني مسجل مسبقا!";
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[200],
          titleText: TextUtils(
              text: title,
              fontsize: 20,
              fontweight: FontWeight.bold,
              color: Colors.black,
              underLine: TextDecoration.none),
          messageText: TextUtils(
              text: message,
              fontsize: 18,
              fontweight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none));
    } catch (error) {
      Get.snackbar(
        "خطأ!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
      );
    }
  }

  void logInUsingEmail(
      {required String emailAddress, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => displayUsername = auth.currentUser!.displayName!);
      update();
      if (emailAddress == "f.delivery.project@gmail.com") {
        Get.offAllNamed(Routes.adminScreen);
        displayUsername= "Admin";
        
      } else {
        Get.offNamed(Routes.userScreen);
        displayUsername = auth.currentUser!.displayName!;
      }
      
    } on FirebaseAuthException catch (e) {
      String message = "";
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      if (e.code == 'user-not-found') {
        message = 'الحساب غير موجود  $emailAddress, تسجيل حساب؟ ';
      } else if (e.code == 'wrong-password') {
        message = 'كلمه المرور خاطئة';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[200],
          titleText: TextUtils(
              text: title,
              fontsize: 20,
              fontweight: FontWeight.bold,
              color: Colors.black,
              underLine: TextDecoration.none),
          messageText: TextUtils(
              text: message,
              fontsize: 18,
              fontweight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none));
    } catch (error) {
      Get.snackbar(
        "خطأ!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
      );
    }
  }

  void signUpUsingGoogle() async {
    // Trigger the authentication flow
    try {
      // ignore: unused_local_variable
      final GoogleSignInAccount?  googleUser = await googleSign.signIn();
       displayUsername = googleSign.currentUser!.displayName;
      // displayUserPhoto = googleSign.currentUser!.photoUrl!;
      adminEmail = googleSign.currentUser!.email;
     

      update();
      //Get.offAllNamed(Routes.userScreen);
      if (adminEmail == "f.delivery.project@gmail.com") {
        Get.offAllNamed(Routes.adminScreen);
        
      } else {
        Get.offNamed(Routes.userScreen);
      }

    } catch (error) {
      Get.snackbar(
        "خطا!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
      );
    }
  }

  void signUpUsingFaceBook() {}
  void resetPassword(String emailAddress) async {
    try {
      await auth.sendPasswordResetEmail(email: emailAddress);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String message = "";
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      if (e.code == 'user-not-found') {
        message = 'حساب غير موجود $emailAddress, تسجيل حساب ';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[200],
          titleText: TextUtils(
              text: title,
              fontsize: 20,
              fontweight: FontWeight.bold,
              color: Colors.black,
              underLine: TextDecoration.none),
          messageText: TextUtils(
              text: message,
              fontsize: 18,
              fontweight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none));
    } catch (error) {
      Get.snackbar(
        "خطأ!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
      );
    }
  }

  void signOut() {}
}

