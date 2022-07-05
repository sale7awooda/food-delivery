import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/routes/routes.dart';
import 'package:orders/utils/theme.dart';

class AllResturantsBtn extends StatelessWidget {
  const AllResturantsBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            color: mainColor,
            width: double.infinity,
            //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 55,
            child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.allResturants);
                },
                child: const Text('عرض كل المطاعم',
                    style: TextStyle(color: Colors.white, fontSize: 20)))),
      ),
    );
  }
}
