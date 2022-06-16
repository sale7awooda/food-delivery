import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/logic/controller/auth_controller.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

import '../../../utils/theme.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBoxVisibility();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: controller.ischecked
                    ? 
                         const Icon(Icons.check, color: mainColor, size: 30)
                    : const Text("")),
          ),
          const SizedBox(
            width: 10,
          ),
          const TextUtils(
              text: "اوافق علي",
              fontsize: 20,
              fontweight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          InkWell(
            onTap: () {},
            child: const TextUtils(
                text: "الشروط والاتفاقيات",
                fontsize: 20,
                fontweight: FontWeight.bold,
                color: mainColor,
                underLine: TextDecoration.underline),
          ),
        ],
      );
    });
  }
}
