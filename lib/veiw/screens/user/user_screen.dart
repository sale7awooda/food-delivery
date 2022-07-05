import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/app_controller.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final controller = Get.find<AppController>();
  
 
  final rnameCtrl = TextEditingController();
  final cnameCtrl = TextEditingController();

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
          
        ),
        body: IndexedStack(
            index: controller.selectedIndex.value,
            // ignore: invalid_use_of_protected_member
            children: controller.adminScreens.value),
        //screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            // onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Orders"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "SignOut"),
              // BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Close"),
            ]),
      );
    });
  }

}
