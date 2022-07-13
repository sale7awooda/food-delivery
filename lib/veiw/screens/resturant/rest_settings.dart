import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/veiw/widgets/auth/auth_buttun.dart';

import '../../../logic/controller/auth_controller.dart';

class RestSettingsScreen extends StatelessWidget {
  const RestSettingsScreen({Key? key}) : super(key: key);
  
   

  @override
  Widget build(BuildContext context) {
   
    final fstoreCtrl = Get.find<AuthController>();
    return  Scaffold(
      body: Center(
        child: AuthButton(text: "Sign Out", onPress: (){fstoreCtrl.signOut();} )
      ),
    );
  }
}
