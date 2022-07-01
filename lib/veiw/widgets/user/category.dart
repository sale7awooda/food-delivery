import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';

class CategoryCard extends StatelessWidget {
  final String? text;
  final String? imgUrl;
  //final Color? color;

  CategoryCard({
    Key? key,
    this.text,
    this.imgUrl, // this.color
  }) : super(key: key);

  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: SizedBox(
                    height: 70,
                    child: ImageNetwork(
                    image: imgUrl!,
                    height: 70,
                    width: 70,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.cover,
                  )),
              ),
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
    );
  }
}
