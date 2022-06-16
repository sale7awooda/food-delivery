import 'package:flutter/material.dart';
import 'package:orders/veiw/widgets/user/category_food_card.dart';



class CategoryFoodList extends StatelessWidget {
  const CategoryFoodList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const CategoryFoodCard();
        },
      ),
    );
  }
}