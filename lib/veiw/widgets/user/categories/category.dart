import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                    child: 
                    CachedNetworkImage(
              width: 70,
              height: 70,
              fit: BoxFit.cover,colorBlendMode: BlendMode.clear,
              
              imageUrl: imgUrl!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 75,
                color: Colors.red,
              ),
            ),
                    
                  //   ImageNetwork(
                  //   image: imgUrl!,
                  //   height: 70,
                  //   width: 70,
                  //   fitAndroidIos: BoxFit.cover,
                  //   fitWeb: BoxFitWeb.cover,
                  // )
                  ),
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
