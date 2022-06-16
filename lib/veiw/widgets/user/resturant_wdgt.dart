import 'package:flutter/material.dart';

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
    return ListTile(
      // tileColor: mainColor,
      // trailing: Image.asset(imgUrl!),
      title: Text(title!),
      subtitle: Text(subtitle!),
      trailing: const Icon(
        Icons.food_bank_outlined,
        size: 40,
      ),
    );
  }
}
