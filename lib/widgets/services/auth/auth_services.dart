import 'package:ecommerce/widgets/utilities/support_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  // The entry point of the Firebase Authentication SDK.
  final _auth = FirebaseAuth.instance;

  // login with google
  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Initializes global sign-in configuration settings.
      /*
      Starts the interactive sign-in process.Returned Future resolves to an instance of [GoogleSignInAccount] for a successful sign in or null in case sign in process was aborted.
      Authentication process is triggered only if there is no currently signed in user (that is when currentUser == null), otherwise this method returns a Future which resolves to the same user instance.
      Re-authentication can be triggered only after [signOut] or [disconnect].
      */
      final googleUser = await GoogleSignIn().signIn();
      final googleAuthentication = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuthentication?.idToken,
        accessToken: googleAuthentication?.accessToken,
      );
      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

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
