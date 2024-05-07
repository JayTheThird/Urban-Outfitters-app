// main file
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/auth/auth_services.dart';
// import 'package:ecommerce/screens/persistent_nav_bar.dart';
//  project file
import 'package:ecommerce/main.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("User Profile"),
          GestureDetector(
            onTap: _userSignOut,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: style.color2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.white,
                    // letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userSignOut() {
    // auth.userSignOut();
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => Tabs(),
    //   ),
    // );
  }
}
