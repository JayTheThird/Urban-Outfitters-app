// main file
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//  project file
import 'package:ecommerce/services/auth/auth_services.dart';
import 'package:ecommerce/widgets/utilities/buttons.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final auth = FirebaseAuth.instance;

  final service = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(auth.currentUser!.email.toString()),
          LoginSignUpButtons(onTap: _userSignOut, message: "Sign out"),
        ],
      ),
    );
  }

  _userSignOut() {
    service.userSignOut();
  }
}
