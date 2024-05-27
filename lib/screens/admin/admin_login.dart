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
import 'package:loader_overlay/loader_overlay.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LoaderOverlay(
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
                  LoginSignUpButtons(
                    onTap: _onTapShowOverlay,
                    message: "Log in",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // overlay
  void _onTapShowOverlay() {
    if (userNameController.text.isEmpty) {
      // Check if Username is empty
      supportingWidgets.textFieldCantBeEmpty(userNameController, context, "User Name field Empty");
      return;
    }

    if (passwordController.text.isEmpty) {
      // Check if password is empty
      supportingWidgets.textFieldCantBeEmpty(passwordController, context, "Password field Empty");
      return;
    }

    // calling _adminLogin
    FirebaseFirestore.instance.collection("Admin").get().then(
      (snapshot) async {
        for (var result in snapshot.docs) {
          if (result.data()["user-name"] != userNameController.text.trim() &&
              result.data()["password"] != passwordController.text.trim()) {
            supportingWidgets.alertSnackBar(context, "credential invalid!");
          } else {
            context.loaderOverlay.show(
              widgetBuilder: (_) {
                return Center(
                  child: SpinKitWave(
                    color: style.color1,
                  ),
                );
              },
            );
            await Future.delayed(const Duration(seconds: 2));
            // ignore: use_build_context_synchronously
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => AdminHome(),
              ),
            );
            // clear textfield data
            clearTextEditingController();
          }
        }
      },
    );

    // Whether this State object is currently in a tree.
    if (!mounted) return;
    // hide overlay
    context.loaderOverlay.hide();
  }

  // clear values of text editing controller
  void clearTextEditingController() {
    userNameController.clear();
    passwordController.clear();
  }
}
