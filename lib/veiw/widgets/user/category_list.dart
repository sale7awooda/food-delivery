
import 'package:flutter/material.dart';
import 'package:orders/model/category_model.dart';

import 'category.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);
  final List _categories = categories;

  //final _random = Random();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            text: categories[index].catName,
            image: categories[index].carImage,
          );
        },
      ),
    );

  }
}
