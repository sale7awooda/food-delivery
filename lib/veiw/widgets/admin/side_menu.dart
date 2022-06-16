import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';

import 'logo.dart';

class SideMenuWdgt extends StatelessWidget {
  const SideMenuWdgt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: lightGreyclr,
      child: SafeArea(
          child: Column(
        children: [
          const Expanded(flex: 2, child: Logo()),
          const Divider(),
          const Text("hello Admin"),
          const Divider(height: 10),
          Expanded(
              flex: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonWdgt(
                            text: "System Stats",
                            onPress: () {
                              Get.toNamed(Routes.adminScreen);
                            })),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonWdgt(
                            text: "Resturants",
                            onPress: () {
                              Get.toNamed(Routes.manageresturants);
                            })),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonWdgt(
                            text: "Categories",
                            onPress: () {
                              Get.toNamed(Routes.managecategories);
                            })),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonWdgt(
                            text: "Orders",
                            onPress: () {
                              Get.toNamed(Routes.managerorders);
                            })),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonWdgt(
                            text: "Foods",
                            onPress: () {
                              Get.toNamed(Routes.managefoods);
                            })),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonWdgt(text: "LogOut", onPress: () {}))
                  ]))
        ],
      )),
    );
  }
}
