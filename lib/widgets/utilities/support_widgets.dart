import 'package:flutter/material.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

class SupportingWidgets {
  // Check if text field is empty
  void textFieldCantBeEmpty(
      TextEditingController controller, BuildContext context, String msg) {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        IconSnackBar.show(
          context,
          label: msg,
          snackBarType: SnackBarType.alert,
          snackBarStyle: SnackBarStyle(
            backgroundColor: style.color2,
            labelTextStyle: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
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
        IconSnackBar.show(
          context,
          label: msg,
          snackBarType: SnackBarType.alert,
          snackBarStyle: SnackBarStyle(
            backgroundColor: style.color2,
            labelTextStyle: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
      );
      return;
    }
  }

  // // Check if password meets minimum length requirement
  void passwordLength(
      TextEditingController controller, BuildContext context, String msg) {
    if (controller.text.length < 6) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        IconSnackBar.show(
          context,
          label: msg,
          snackBarType: SnackBarType.alert,
          snackBarStyle: SnackBarStyle(
            backgroundColor: style.color2,
            labelTextStyle: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
      );
      return;
    }
  }

  // success SnackBar
  void successSnackBar(BuildContext context, String message) {
    IconSnackBar.show(
      context,
      label: message,
      snackBarType: SnackBarType.success,
      snackBarStyle: SnackBarStyle(
        backgroundColor: style.color2,
        labelTextStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  // alert snack bar
  void alertSnackBar(BuildContext context, String message) {
    IconSnackBar.show(
      context,
      label: message,
      snackBarType: SnackBarType.alert,
      snackBarStyle: SnackBarStyle(
        backgroundColor: style.color2,
        labelTextStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
