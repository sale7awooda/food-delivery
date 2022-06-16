import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.fontweight,
      required this.color,
      required this.underLine
       })
      : super(key: key);
  final String text;
  final double fontsize;
  final FontWeight fontweight;
  final Color color;
  final TextDecoration? underLine;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
            textStyle: TextStyle(
                decoration: underLine,
                fontSize: fontsize,
                color: color,
                fontWeight: fontweight)));
  }
}
