import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

import 'package:orders/veiw/widgets/user/text_utils.dart';

class ManageOrders extends StatelessWidget {
  const ManageOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: TextUtils(
                    text: "الطلبات",
                    fontsize: 25,
                    fontweight: FontWeight.bold,
                    color: mainColor,
                    underLine: TextDecoration.none),
              ),
            ),
            Center(
              child: Divider(),
            )
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: lightGreyclr,
                height: MediaQuery.of(context).size.height,
              )
            ],
          ),
        )
      ],
    );
  }
}
