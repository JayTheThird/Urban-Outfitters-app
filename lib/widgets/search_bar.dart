// Main files
import 'package:flutter/material.dart';
// Project Files
import 'package:ecommerce/main.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: style.color2,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        cursorColor: style.color1,
        style: TextStyle(
          color: style.color2,
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        autocorrect: true,
        decoration: InputDecoration(
          hintText: "Search here..",
          hintStyle:
              style.subTitle.copyWith(fontSize: 20, color: style.color1),
          suffixIcon: Icon(
            Icons.search,
            size: 32.5,
            color: style.color2,
          ),
          // disabledBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
