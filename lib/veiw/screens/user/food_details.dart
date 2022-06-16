import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/buttun_wdgt.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text(" FOOD DELIVERY"),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 10),
          Center(
              child: Stack(children: [
            Image.asset(
              "images/groceries.png",
              height: 300,
              fit: BoxFit.cover,
            ),
          ])),
          const SizedBox(height: 20),
          const FoodDetailsText(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add)),
                Text(quantity.toString(),style: const TextStyle(fontSize: 20),),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity != 0) {
                          quantity--;
                        } else {}
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ],
            ),
          ),
          ButtonWdgt(text: "اضف للسلة", onPress: () {})
        ]),
      ),
    );
  }
}

class FoodDetailsText extends StatelessWidget {
  const FoodDetailsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(20)),
          child: const Center(
              child: Text(
                  textAlign: TextAlign.center,
                  "food item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Detailsfood item Details")),
        ));
  }
}
