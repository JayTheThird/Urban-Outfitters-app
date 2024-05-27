// main files
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
// project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/users/persistent_nav_bar.dart';
import 'package:ecommerce/screens/users/user_login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance
            .authStateChanges(), // Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
        // we will listen to authStateChanges if the user return here not equal to null then we go tabs() and if the user return here equal to null then it go login()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // data has not been fetch yet, but it try to fetch data
            return Center(
              child: SpinKitThreeBounce(
                color: style.color2,
                duration: Duration(seconds: 10),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: SpinKitDancingSquare(
                color: style.color2,
                duration: Duration(seconds: 10),
              ),
            );
          } else {
            if (snapshot.data == null) {
              // User is not logged in, but signed out
              return const Login();
            } else {
              // user logged in
              return const Tabs();
            }
          }
        },
      ),
    );
  }
}
