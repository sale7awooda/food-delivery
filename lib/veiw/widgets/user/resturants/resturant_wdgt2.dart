import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:orders/utils/theme.dart';

class ResurantWdgt2 extends StatelessWidget {
  ResurantWdgt2({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imgUrl,
    this.rStatus,
    this.price,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? imgUrl;
  final bool? rStatus;
  final String? price;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: const BoxConstraints(
            //maxHeight: 150,
            ),
        color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
            [_random.nextInt(9) * 100],

        //Colors.black.withOpacity(.7),
        child: Stack(alignment: Alignment.center, //fit: StackFit.loose,
            children: [
              Positioned(
                left: 0,
                child: CachedNetworkImage(
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                  colorBlendMode: BlendMode.clear,
                  imageUrl: imgUrl!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 75,
                    color: Colors.red,
                  ),
                ),
                //  ImageNetwork(
                //   image: imgUrl!,
                //   height: 90,
                //   width: 90,
                //   fitAndroidIos: BoxFit.cover,
                //   fitWeb: BoxFitWeb.cover,
                // ),
              ),

              // Image.asset(
              //   "images/groceries.png",
              //   fit: BoxFit.scaleDown,
              //   height: 100,
              // )),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                // tileColor: mainColor,
                // trailing: Image.asset(imgUrl!),
                title: Text(title!,
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: mainColor, fontWeight: FontWeight.bold)),
                subtitle: Text(subtitle!,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
                leading: CircleAvatar(
                    child: Text(price!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                //         leading: Container(
                //   decoration: BoxDecoration(
                //       color:rStatus == null ? Colors.yellow :(rStatus == "true" ? Colors.green : redClr),
                //       borderRadius: BorderRadius.circular(15)),
                //   height: 15,
                //   width: 15,
                // ),
              ),
              // Positioned(right: 10,top: 10,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color:
              //         // rStatus == null
              //         //     ? Colors.yellow
              //         //     : (
              //               rStatus!  ? Colors.green : redClr
              //               // )
              //               ,
              //         borderRadius: BorderRadius.circular(15)),
              //     height: 20,
              //     width: 20,
              //   ),
              // )
            ]),
      ),
    );
  }
}
