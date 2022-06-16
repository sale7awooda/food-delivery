import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class MostOrderedScreen extends StatelessWidget {
  const MostOrderedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: mainColor,leading: IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),),body: const Center(child: Text("data"),),);
  }
}
