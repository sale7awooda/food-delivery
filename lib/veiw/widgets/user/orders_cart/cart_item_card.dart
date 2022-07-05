import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: mainColor),
    );
  }
}
