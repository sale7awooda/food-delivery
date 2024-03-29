import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import 'package:orders/utils/theme.dart';

class OrderWdgt extends StatelessWidget {
  final String? text;
  final String? price;
  final String? imgUrl;
  //final Color? color;

  OrderWdgt({
    Key? key,
    this.text,
    this.price,
    this.imgUrl,
  }) : super(key: key);

  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 180,
          height: 80,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              text!,
                              style:
                                  const TextStyle(color: mainColor, fontSize: 20)),
                        ],
                      ),
                      Row(
                        children: [
                          
                          Text(
                              //textAlign: TextAlign.center,
                              price!,
                              style: const TextStyle(
                                  color: mainColor, fontSize: 20)),
                          // const Text(
                          //   "\$ ",
                          //   style: TextStyle(fontSize: 20),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
