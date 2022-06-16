
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:orders/utils/theme.dart';
import 'package:orders/veiw/widgets/user/text_utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  final String text;
  final Callback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          primary:mainColor, 
          minimumSize: const Size(360, 50)),
      child:  TextUtils(
          text: text,
          fontsize: 18,
          fontweight: FontWeight.bold,
          color: Colors.white,
          underLine: TextDecoration.none),
    );
  }
}
