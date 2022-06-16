import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/firestore_controller.dart';
import 'package:orders/model/resturant_model.dart';

import 'package:orders/veiw/widgets/user/resturant_wdgt.dart';

class ResturantsList extends StatefulWidget {
  const ResturantsList({
    Key? key,
  }) : super(key: key);

  @override
  State<ResturantsList> createState() => _ResturantsListState();
}

class _ResturantsListState extends State<ResturantsList> {
  final fstoreCtrl = Get.find<FirestoreController>();

  List<ResturantModel> _loaddedResturants = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _loaddedResturants.length,
      itemBuilder: (BuildContext context, int index) {
        return ResurantWdgt(
          title: _loaddedResturants[index].rname!,
          subtitle: _loaddedResturants[index].rdetial!,
        );
      },
    );
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
