import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                //height: 300,
                decoration: const BoxDecoration(color: lightGreyclr),
                child: const Center(child: Text("الطلبات ف السلة الان"),),
              ),
            )),
        const Expanded(flex: 3, child:  SingleChildScrollView(child: Center(child: Text("الطلبات القديمة"),),))
      ],
    ));
  }
}
