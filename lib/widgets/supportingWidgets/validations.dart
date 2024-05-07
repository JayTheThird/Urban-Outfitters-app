import 'package:flutter/material.dart';

class SupportingValidation {
  // Check if text field is empty
  void textFieldCantBeEmpty(
      TextEditingController controller, BuildContext context, String msg) {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
      return;
    }
  }

  // Check if email is valid
  void textFieldEmailValid(
      TextEditingController controller, BuildContext context, String msg) {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(controller.text)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
      return;
    }
  }

  void passwordLength(
      TextEditingController controller, BuildContext context, String msg) {
    if (controller.text.length < 6) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
      return;
    }
  }
}
