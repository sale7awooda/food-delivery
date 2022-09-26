import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/veiw/widgets/auth/auth_buttun.dart';

import '../../../logic/controller/auth_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
  
    final fstoreCtrl = Get.find<AuthController>();
    return  Scaffold(
      body: Center(
        child: AuthButton(text: "تسجيل خروج", onPress: (){fstoreCtrl.signOut();} )
      ),
    );
  }
}
