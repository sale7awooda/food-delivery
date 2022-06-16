
import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class SideTitle extends StatelessWidget {
  const SideTitle({this.sTitle,
    Key? key,
  }) : super(key: key);
final String? sTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sTitle!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: mainColor),
        ),
        const Icon(
          Icons.arrow_forward,
          color: mainColor,
          size: 30,
        )
      ],
    ),
  );
  }
}
