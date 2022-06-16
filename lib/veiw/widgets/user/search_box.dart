import 'package:flutter/material.dart';
import 'package:orders/utils/theme.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child:  TextField(
            decoration: InputDecoration(filled: true,
                suffixIcon: Material(elevation: 5,
                borderRadius: BorderRadius.circular(20),
                  child: const Icon(
                    Icons.search,
                    color: mainColor,
                  ),
                ),
                hintText: "ابحث عن ...",
                hintStyle: const TextStyle(color: mainColor),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(15)),
          )),
    );
  }
}
