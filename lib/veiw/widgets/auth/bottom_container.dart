
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer(
      {Key? key,
      required this.text,
      required this.onpress,
      required this.texttype})
      : super(key: key);
  final String text;
  final String texttype;
  final Callback onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
          color:  mainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontsize: 20,
              fontweight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onpress,
              child: TextUtils(
                  text: texttype,
                  fontsize: 20,
                  fontweight: FontWeight.bold,
                  color: Colors.white,
                  underLine: TextDecoration.underline))
        ],
      ),
    );
  }
}
