import 'package:flutter/material.dart';

import 'package:orders/utils/theme.dart';

class TextFormWdgt extends StatelessWidget {
  final TextEditingController controller;

  final Widget lable;
  final Function? validator;
  final String? hint;
  
  

  const TextFormWdgt({
    Key? key,
    required this.controller,
    required this.lable,
    this.validator,
    this.hint,
  }) : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 18,
          decoration: TextDecoration.none,
          color: mainColor,
        ),
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        validator: (value) => validator!(value),
        decoration: InputDecoration(
          //fillColor:Colors.white10,
          label: lable,
          labelStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: mainColor),
          filled: true,
          hintText: hint,

          hintStyle: const TextStyle(
              color: mainColor, fontWeight: FontWeight.bold, fontSize: 18),

          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: mainColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: mainColor),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: redClr),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: redClr),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
