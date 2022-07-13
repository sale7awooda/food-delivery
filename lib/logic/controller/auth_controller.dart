import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  bool isVisable = false;
  bool ischecked = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSign = GoogleSignIn();
  String displayUsername = "";
  String displayUserPhoto = "";
  var loginEmail = "";
  final String adminEmail = "f.delivery.project@gmail.com";

  String cartid = const Uuid().v4();
  //final fstoreCtrl = Get.find<FirestoreController>();

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
    String chechEmail = "";
    String restID = '';
    String restName = '';
    String restImg = '';
    try {
      await auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => displayUsername = auth.currentUser!.email!);

      //fstoreCtrl.getrestName(emailAddress).then((value) => print(value));
      await FirebaseFirestore.instance
          .collection('restaurants')
          .where('restOwner', isEqualTo: emailAddress.trim())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          chechEmail = doc["restOwner"];
          restID = doc.id;
          restName = doc["restName"];
          restImg = doc["restImg"];
          //print(loginEmail+" loginEmail");
          // print(doc.id);
        }
      });
      update();

      if (emailAddress == "f.delivery.project@gmail.com") {
        Get.offAllNamed(Routes.adminScreen);
        displayUsername = "Admin";
      } else if (emailAddress == chechEmail) {
        Get.offAllNamed(Routes.resturantsScreen,
            arguments: [restID, restName, restImg]);
      } else {
        Get.offAllNamed(
          Routes.userScreen,
        );
        // displayUsername = auth.currentUser!.displayName!;
        displayUsername = auth.currentUser!.uid;
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
    String chechEmail = "";
    String restID = '';
    String restName = '';
    String restImg = '';
    try {
      // ignore: unused_local_variable
      final GoogleSignInAccount? googleUser = await googleSign.signIn();
      // displayUsername = googleSign.currentUser!.email;
      displayUsername = googleSign.currentUser!.id;
      // displayUserPhoto = googleSign.currentUser!.photoUrl!;
      loginEmail = googleSign.currentUser!.email;

      await FirebaseFirestore.instance
          .collection('restaurants')
          .where('restOwner', isEqualTo: loginEmail.trim())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          chechEmail = doc["restOwner"];
          restID = doc.id;
          restName = doc["restName"];
          restImg = doc["restImg"];
          //print(loginEmail+" loginEmail");
          // print(doc.id);
        }
      });

      update();
      //  fstoreCtrl.getrestName(loginEmail).then((value) => print(value));
      //Get.offAllNamed(Routes.userScreen);
      if (loginEmail == adminEmail) {
        Get.offNamed(Routes.adminScreen);
      } else if (loginEmail == chechEmail) {
        Get.offAllNamed(Routes.resturantsScreen,
            arguments: [restID, restName, restImg]);
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

  // void signUpUsingFaceBook() {}
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

  void signOut() async {
    try {
      await googleSign.signOut();
      await auth.signOut();
      displayUsername = "";
      update();
      Get.offAllNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar("خطأ!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[200]);
    }
  }

  void signOutAdmin(int w) async {
    try {
      if (w <= 400) {
        await googleSign.signOut();
        await auth.signOut();
      } else {
        await auth.signOut();
      }

      displayUsername = "";
      update();
      Get.offAllNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar("خطأ!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[200]);
    }
  }
}
