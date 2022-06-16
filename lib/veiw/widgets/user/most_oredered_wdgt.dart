import 'package:flutter/material.dart';

import 'order_wdgt.dart';


class MostOrderedWdgt extends StatelessWidget {
  const MostOrderedWdgt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child:  OrderWdgt(),
          );
        },
      ),
    );
  }
}
