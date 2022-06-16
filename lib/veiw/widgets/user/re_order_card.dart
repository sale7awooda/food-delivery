import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class ReorderCard extends StatelessWidget {
  final String? restName;
  final String? order;
  final double? price;

  const ReorderCard({
    Key? key,
    this.restName,
    this.order,
    this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 280,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restName!,
                  style: const TextStyle(fontWeight: FontWeight.bold,color: mainColor),
                ),
                Text(order!,style: const TextStyle(color: mainColor)),
              ],
            ),
            Positioned(
              left: 10,
              //top: 10,
              child: Text('USD $price',style: const TextStyle(color: mainColor),),
            ),
            Positioned(
              bottom: -20,right: 60,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.refresh, color: mainColor),
                            SizedBox(width: 5),
                            Text('إعاده الطلب',
                                style: TextStyle(color: mainColor))
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
