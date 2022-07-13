import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';

import 'package:orders/veiw/widgets/user/resturants/all_resturants_btn.dart';
import 'package:orders/veiw/widgets/user/categories/category.dart';
// import 'package:orders/veiw/widgets/user/category_list.dart';
import 'package:orders/veiw/widgets/user/most_oredered_wdgt.dart';
import 'package:orders/veiw/widgets/user/search_box.dart';
import 'package:orders/veiw/widgets/user/side_title.dart';
import 'package:orders/veiw/widgets/user/welcome_text.dart';

import '../../../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fstoreCtrl = Get.find<FirestoreController>();
  final scrollctrl = ScrollController();
  static String fCategoryName = 'catName';
  static String fCategoryImg = 'catImg';
  static String? fCategoryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const WelcomeText(),
          const SizedBox(height: 20),
          const SearchBox(),
          const SizedBox(height: 20),

          categorieslist2(),

          //CategoryList(),
          const SizedBox(height: 10),
          const SideTitle(sTitle: "الأكثر شيوعا"),
          const SizedBox(height: 10),
          const MostOrderedWdgt(),
          const SizedBox(height: 10),
          const AllResturantsBtn(),
        ],
      ),
    ));
  }

  SizedBox categorieslist2() {
    return SizedBox(
      height: 150,
      child: StreamBuilder(
          stream: fstoreCtrl.categoryCol.snapshots(),
          //initialData: initialData,
          builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
            if (streamSnapshot.hasData) {
              return !streamSnapshot.hasData
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: scrollctrl,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot categorySnapshot =
                            streamSnapshot.data!.docs[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              fCategoryID = streamSnapshot.data!.docs[index].id;

                              // print(fCategoryID);
                            });
                            Get.toNamed(Routes.categorydetails,
                                arguments: fCategoryID);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CategoryCard(
                                text: categorySnapshot[fCategoryName],
                                imgUrl: categorySnapshot[fCategoryImg],
                              )),
                        );
                      });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
