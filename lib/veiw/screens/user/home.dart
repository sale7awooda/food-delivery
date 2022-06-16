import 'package:flutter/material.dart';

import 'package:orders/veiw/widgets/user/all_resturants_btn.dart';
import 'package:orders/veiw/widgets/user/category_list.dart';
import 'package:orders/veiw/widgets/user/most_oredered_wdgt.dart';
import 'package:orders/veiw/widgets/user/search_box.dart';
import 'package:orders/veiw/widgets/user/side_title.dart';
import 'package:orders/veiw/widgets/user/welcome_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          CategoryList(),
          const SizedBox(height: 10),
          const SideTitle(sTitle: "الأكثر طلبا"),
          const SizedBox(height: 10),
          const MostOrderedWdgt(),
          const SizedBox(height: 10),

          // const OrderAgainText(),
          // const ReorderList(),
          const AllResturantsBtn(),
        ],
      ),
    ));
  }
}
