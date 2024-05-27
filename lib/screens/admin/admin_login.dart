// main files
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/admin/admin_home.dart';
import 'package:ecommerce/widgets/utilities/support_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// project file
import 'package:ecommerce/main.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';
import 'package:ecommerce/widgets/utilities/buttons.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  //
  final supportingWidgets = SupportingWidgets();

  // text editing controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isLoadingGoogle = false;
  bool isLoadingFacebook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Admin Login',
                  style: TextStyle(
                    color: style.color1,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 25),
                // username textfield
                MyTextField(
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  hintText: 'User Name',
                  obscureText: false,
                ),
                SizedBox(height: 12),
                // password textfield
                MyTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                // log in button
                isLoading
                    ? SpinKitWave(
                        color: style.color1,
                      )
                    : LoginSignUpButtons(
                        onTap: _adminLogin,
                        message: "Log in",
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // clear values of text editing controller
  void clearTextEditingController() {
    userNameController.clear();
    passwordController.clear();
  }

  // sign user in method
  void _adminLogin() async {
    setState(() {
      isLoading = true;
    });

    final instance = FirebaseFirestore.instance;

    await instance.collection("Admin").get().then(
      (snapshot) {
        for (var result in snapshot.docs) {
          if (result.data()["user-name"] != userNameController.text.trim()) {
            supportingWidgets.alertSnackBar(context, "username invalid!");
          } else if (result.data()["password"] != passwordController.text.trim()) {
            supportingWidgets.alertSnackBar(context, "password invalid!");
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => AdminHome(),
              ),
            );
          }
        }
      },
    );

    setState(() {
      isLoading = false;
    });
  }
}
