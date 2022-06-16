import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            color: Colors.grey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("images/backpic.jpg")],
            )),
      ),
    );
  }
}
