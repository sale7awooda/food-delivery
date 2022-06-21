import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class ResurantWdgt extends StatelessWidget {
  ResurantWdgt({
    Key? key,
    required this.title,
    required this.subtitle,
    // this.imgUrl,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  //final String? imgUrl;
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
        child: Stack(alignment: Alignment.center,//fit: StackFit.loose,
         children: [
          Positioned(
              left: 0,
              child: Image.asset(
                "images/groceries.png",
                fit: BoxFit.scaleDown,
                height: 100,
              )),
          ListTile(contentPadding: const EdgeInsets.all(20),
            // tileColor: mainColor,
            // trailing: Image.asset(imgUrl!),
            title: Text(title!,
                //textAlign: TextAlign.center,
                style: const TextStyle(
                    color: mainColor, fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle!,
                // textAlign: TextAlign.center,
                style: const TextStyle(color: mainColor)),
          ),
        ]),
      ),
    );

  }
}
