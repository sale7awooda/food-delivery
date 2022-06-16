import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/category_food_list.dart';
import 'package:orders/veiw/widgets/user/search_box.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({
    Key? key,
    this.title,
    this.image,
    this.subtitle,
  }) : super(key: key);
  final String? title;
  final String? image;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),],
          elevation: 0,
          title: const Text(" FOOD DELIVERY"),
          centerTitle: true,
        ),
        body: Column(
          children: const [
            SizedBox(height: 20),
            SearchBox(),
            SizedBox(height: 20),
            Expanded(child: CategoryFoodList()),
          ],
        ));
  }
}
