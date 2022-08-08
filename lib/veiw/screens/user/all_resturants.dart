import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/routes/routes.dart';

import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/resturants/resturant_wdgt2.dart';


class AllResturantsScreen extends StatefulWidget {
  const AllResturantsScreen({
    Key? key,
    this.title,
    this.image,
    this.subtitle,
  }) : super(key: key);
  final String? title;
  final String? image;
  final String? subtitle;

  @override
  State<AllResturantsScreen> createState() => _AllResturantsScreenState();
}

class _AllResturantsScreenState extends State<AllResturantsScreen> {
  final fstoreCtrl = Get.find<FirestoreController>();
  final scrollctrl = ScrollController();
  static String fResturantName = 'restName';
  static String fResturantDetails = 'restDetail';
  static String fResturantImg = 'restImg';
  static String? fResturantID;

  //final List<ResturantModel> _loaddedResturants = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            // const SearchBox(),
            // const SizedBox(height: 20),
            Expanded(
                child: StreamBuilder(
                      stream: fstoreCtrl.restaurantCol.snapshots(),
                      //initialData: initialData,
                      builder:
                          (BuildContext context, AsyncSnapshot streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return !streamSnapshot.hasData
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  controller: scrollctrl,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot resturantSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        hoverColor: Colors.lightBlue[200],
                                        onTap: () {
                                          setState(() {
                                      fResturantID =
                                          streamSnapshot.data!.docs[index].id;
                                     // print(fResturantID);
                                    });
                                    Get.toNamed(Routes.resturant,
                                        arguments: fResturantID);
                                          

                                          
                                        },
                                        child: ResurantWdgt2(
                                          title:
                                              resturantSnapshot[fResturantName],
                                          subtitle: resturantSnapshot[
                                              fResturantDetails],
                                          imgUrl:
                                              resturantSnapshot[fResturantImg],
                                        ),
                                      ),
                                    );
                                  });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                
                
                
                // StreamBuilder(
                //     stream: fstoreCtrl.restaurantCol.snapshots(),
                //     //initialData: initialData,
                //     builder:
                //         (BuildContext context, AsyncSnapshot streamSnapshot) {
                //       if (streamSnapshot.hasData) {
                //         return !streamSnapshot.hasData
                //             ? const Center(child: CircularProgressIndicator())
                //             : ListView.builder(
                //                 scrollDirection: Axis.vertical,
                //                 controller: scrollctrl,
                //                 itemCount: streamSnapshot.data!.docs.length,
                //                 itemBuilder: (context, index) {
                //                   final DocumentSnapshot resturantSnapshot =
                //                       streamSnapshot.data!.docs[index];
                //                   return Padding(
                //                     padding: const EdgeInsets.all(10.0),
                //                     child: InkWell(
                //                       hoverColor: Colors.lightBlue[200],
                //                       onTap: () {},
                //                       child: ResurantWdgt(
                //                         title:
                //                             resturantSnapshot[fResturantName],
                //                         subtitle: resturantSnapshot[
                //                             fResturantDetails],
                //                       ),

                                     
                //                     ),
                //                   );
                //                 });
                //       }
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     })




                //         ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: _loaddedResturants.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return ResurantWdgt(
                //       title: _loaddedResturants[index].rname!,
                //       subtitle: _loaddedResturants[index].rdetial!,
                //     );
                //   },
                // )

                ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
