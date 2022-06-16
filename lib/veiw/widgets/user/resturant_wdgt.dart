import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class ResurantWdgt extends StatelessWidget {
  const ResurantWdgt({
    Key? key,
    required this.title,
    required this.subtitle,
    // this.imgUrl,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  //final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 100,
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  color: lightGreyclr, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.centerLeft,
              // width: 100,
              child: ListTile(
                // tileColor: mainColor,
                // trailing: Image.asset(imgUrl!),
                title: Text(title!),
                subtitle: Text(subtitle!),
                trailing: const Icon(Icons.food_bank_outlined,size: 40,),
              ))
        ]),
      ),
    );
  }
}
