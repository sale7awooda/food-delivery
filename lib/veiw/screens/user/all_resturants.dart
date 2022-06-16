import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/resturant_model.dart';

import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/resturant_wdgt.dart';

import 'package:orders/veiw/widgets/user/search_box.dart';


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

  List<ResturantModel> _loaddedResturants = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    getResturants();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Column(
          children:  [
            const SizedBox(height: 20),
            const SearchBox(),
            const SizedBox(height: 20),
            Expanded(child: 
            
            ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _loaddedResturants.length,
      itemBuilder: (BuildContext context, int index) {
        return ResurantWdgt(
          title: _loaddedResturants[index].rname!,
          subtitle: _loaddedResturants[index].rdetial!,
        );
      },
    )
            
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    getResturants();
  }

  void getResturants() async {
    
    _loaddedResturants = await fstoreCtrl.loadResturants();
  }
}
