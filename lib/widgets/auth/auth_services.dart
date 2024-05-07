import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthServices {
  // The entry point of the Firebase Authentication SDK.
  final _auth = FirebaseAuth.instance;

  // Login
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          //Attempts to sign in a user with the given email address and password.
          email: email,
          password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  // registration
  Future<User?> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          //Tries to create a new user account with the given email address and password.
          email: email,
          password: password);

      return cred.user;
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
