import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.shopping_cart,
            size: 150,
          ),
          SizedBox(
            height: 40,
          ),
          TextUtils(
              text: "Your Cart Is Empty",
              fontsize: 25,
              fontweight: FontWeight.bold,
              color: mainColor,
              underLine: TextDecoration.none),
          SizedBox(height: 10),
          Text("Add Items First")
        ],
      ),
    );
  }
}
