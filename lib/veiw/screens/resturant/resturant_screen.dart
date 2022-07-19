import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/app_controller.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/utils/theme.dart';

class ResturantsScreen extends StatefulWidget {
  const ResturantsScreen({Key? key}) : super(key: key);

  @override
  State<ResturantsScreen> createState() => _ResturantsScreenState();
}

class _ResturantsScreenState extends State<ResturantsScreen> {
  final controller = Get.find<AppController>();
   final fsctrl= Get.find<FirestoreController>();
  // String? argmnts= Get.arguments;

  final rnameCtrl = TextEditingController();
  final cnameCtrl = TextEditingController();
  var arguments = Get.arguments;
  

  int selectedIndexResturant = 0;
  @override
  Widget build(BuildContext context) {
    var restID=arguments[0];
    // return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
        ),
        body: IndexedStack(
            index: selectedIndexResturant,
            //controller.selectedIndexResturant.value,
            // ignore: invalid_use_of_protected_member
            children: controller.resturantScreens.value),
        //screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndexResturant,
            //controller.selectedIndexResturant.value,
            onTap: (index) {
              setState(() {
                selectedIndexResturant=index;
              });
              //controller.selectedIndexResturant.value = index;
              fsctrl.restID=restID;

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
    // });
  }
}
