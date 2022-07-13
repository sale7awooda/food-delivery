import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/app_controller.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/screens/admin/manage_categories.dart';
import 'package:orders/veiw/screens/admin/manage_foods.dart';
import 'package:orders/veiw/screens/admin/manage_orders.dart';

import 'manage_resturant.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  PageController page = PageController();
  final fstoreCtrl = Get.find<AuthController>();
  //final appCtrl= Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    int wid =MediaQuery.of(context).size.width.toInt();
    return SafeArea(
        child: Scaffold(
            backgroundColor: lightGreyclr,
            // appBar: Responsive.isDesktop(context)
            //     ? null
            //     : AppBar(
            //         elevation: 0,
            //         title: const Text(" FOOD DELIVERY"),
            //         centerTitle: true,
            //         backgroundColor: mainColor,
            //         leading: Builder(
            //             builder: (context) => IconButton(
            //                 onPressed: () {
            //                   Scaffold.of(context).openDrawer();
            //                 },
            //                 icon: const Icon(Icons.menu)))),
            // drawer: Drawer(
            //   child: SideMenuCustom(page: page),
            // ),
            // const SideMenuWdgt(),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SideMenu(
                  controller: page,
                  // onDisplayModeChanged: (mode) {
                  //   print(mode);
                  // },
                  style: SideMenuStyle(
                    displayMode: SideMenuDisplayMode.auto,
                    hoverColor: Colors.blue[100],
                    selectedColor: mainColor,
                    selectedTitleTextStyle:
                        const TextStyle(color: Colors.white),
                    selectedIconColor: Colors.white,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    // backgroundColor: Colors.blueGrey[700]
                  ),
                  title: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 150,
                          maxWidth: 150,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/backpic.jpg',
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 8.0,
                        endIndent: 8.0,
                      ),
                    ],
                  ),
                  footer: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Food Delivery System',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  items: [
                   
                    SideMenuItem(
                      priority: 0,
                      title: 'المطاعم',
                      onTap: () {
                        page.jumpToPage(0);
                      },
                      icon: const Icon(Icons.restaurant),
                    ),
                    SideMenuItem(
                      priority: 1,
                      title: 'الاصناف',
                      onTap: () {
                        page.jumpToPage(1);
                      },
                      icon: const Icon(Icons.category),
                    ),
                    SideMenuItem(
                      priority: 2,
                      title: 'الطلبات',
                      onTap: () {
                        page.jumpToPage(2);
                      },
                      icon: const Icon(Icons.inventory_rounded),
                    ),
                    SideMenuItem(
                      priority: 3,
                      title: 'الاطعمة',
                      onTap: () {
                        page.jumpToPage(3);
                      },
                      icon: const Icon(Icons.dinner_dining),
                    ),
                    SideMenuItem(
                      priority: 4,
                      title: 'خروج',
                      onTap: () {
                        fstoreCtrl.signOutAdmin(wid);
                      },
                      icon: const Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: page,
                    children: [
                      
                      Container(
                          color: Colors.white, child: const ManageResturants()),
                      Container(
                          color: Colors.white, child: const ManageCategories()),
                      Container(
                        color: Colors.white,
                        child:  ManageOrders(),
                      ),
                      Container(
                        color: Colors.white,
                        child: const ManageFoods(),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
