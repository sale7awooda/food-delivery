import 'package:flutter/material.dart';
import 're_order_card.dart';


class ReorderList extends StatelessWidget {
  const ReorderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const[
          ReorderCard(
            restName: 'مطعم 1',
            order: ' طلب',
            price: 10,
          ),
          ReorderCard(
            restName: 'مطعم 2',
            order: 'طلب',
            price: 20,
          ),
          ReorderCard(
            restName: 'مطعم 3',
            order: 'طلب',
            price: 30,
          ),
        ],
      ),
    );
  }
}
