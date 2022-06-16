import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class MainSection extends StatelessWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Expanded(
          child: Container(
              color: redClr,
            ),
        ));
  }
}
