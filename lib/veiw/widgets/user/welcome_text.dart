import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';


class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextUtils(
          text: " ماذا ترغب ان تأكل؟",
          fontsize: 30,
          fontweight: FontWeight.bold,
          color: mainColor,
          underLine: TextDecoration.none,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_alt,
              color: mainColor,
            ))
      ],
    );
  }
}
