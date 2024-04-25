// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/main.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        cursorColor: style.color2,
        style: TextStyle(
          // remover underline text
          color: style.color2,
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        autocorrect: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: style.color2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: style.color2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            letterSpacing: 2,
            color: style.color2,
          ),
        ),
      ),
    );
  }
}
