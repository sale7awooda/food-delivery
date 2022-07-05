import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/orders_cart/cart_item_card.dart';
import 'package:orders/veiw/widgets/user/orders_cart/empty_cart.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: //EmptyCart(),
            SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const CartItemCard();
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
