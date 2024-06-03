// ignore: file_names
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginSignUpButtons extends StatelessWidget {
  LoginSignUpButtons({super.key, required this.onTap, required this.message, this.onLongPress});

  void Function() onTap;
  void Function()? onLongPress;
  String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: style.color2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
