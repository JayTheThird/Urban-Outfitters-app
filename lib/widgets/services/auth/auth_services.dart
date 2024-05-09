import 'package:ecommerce/widgets/utilities/support_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter/material.dart';

class AuthServices {
  // The entry point of the Firebase Authentication SDK.
  final _auth = FirebaseAuth.instance;

  // Login
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          //Attempts to sign in a user with the given email address and password.
          email: email,
          password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      exceptionHandler(e.code, context);
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  // registration
  Future<User?> registerUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          //Tries to create a new user account with the given email address and password.
          email: email,
          password: password);

      return cred.user;
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      exceptionHandler(e.code, context);
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  //  log-out
  Future<void> userSignOut() async {
    try {
      await _auth.signOut(); //Signs out the current user
    } catch (e) {
      log("Something went wrong");
    }
  }
}

final supportingWidgets = SupportingWidgets();
exceptionHandler(String code, BuildContext context) async {
  switch (code) {
    case "invalid-credential":
      {
        supportingWidgets.alertSnackBar(context, "Invalid email or Password");
        await Future.delayed(Duration(seconds: 2));
        //Removes the current SnackBar.
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      }
      break;
    case "email-already-in-use":
      {
        supportingWidgets.alertSnackBar(context, "Email Already Used");
        await Future.delayed(Duration(seconds: 2));
        //Removes the current SnackBar.
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      }
      break;

    default:
      log("Something went wrong");
  }
}
