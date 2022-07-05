import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';


class CategoryFoodCard extends StatelessWidget {
  const CategoryFoodCard({
    Key? key,
    // required this.title,
    // required this.subtitle,
  }) : super(key: key);

  // final String? title;
  // final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: 150,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: redClr, borderRadius: BorderRadius.circular(20)),
          )
        ]),
      ),
    );
  }
}
