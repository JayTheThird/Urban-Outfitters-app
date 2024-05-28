//  Main Files
import 'package:flutter/material.dart';
// Project files
import 'package:ecommerce/main.dart';

// ignore: must_be_immutable
class MainButton1 extends StatelessWidget {
  MainButton1({
    super.key,
    required this.title,
    required this.colorBG,
    required this.onTap,
    this.width,
  });

  final String title;
  final Color colorBG;
  double? width;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colorBG,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: style.mainTitle.copyWith(
            fontSize: 16,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
