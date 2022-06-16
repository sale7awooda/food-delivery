
import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class AuthTextForm extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final String? hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Widget lable;

  const AuthTextForm(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.validator,
      this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.lable})
      : super(key: key);

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
        obscureText: obscureText,
        cursorColor: Colors.black,
        validator: (value) => validator(value),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          //fillColor:Colors.white10,
          label: lable,
          labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mainColor),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
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
