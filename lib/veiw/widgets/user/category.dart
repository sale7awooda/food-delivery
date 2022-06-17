import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';

class CategoryCard extends StatelessWidget {
  final String? text;
  final String? image;
  //final Color? color;

  CategoryCard({
    Key? key,
    this.text,
    this.image, // this.color
  }) : super(key: key);

  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Get.toNamed(Routes.categorydetails);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 170,
            height: 75,
            color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                [_random.nextInt(9) * 100],
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                    height: 70,
                    child: Image.asset(image!,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        text!,
                        style: const TextStyle(color: mainColor, fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
