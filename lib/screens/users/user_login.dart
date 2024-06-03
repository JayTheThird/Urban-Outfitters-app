// main files

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// project file
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/users/user_registration.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';
import 'package:ecommerce/widgets/utilities/app_logo_square_tile.dart';
import 'package:ecommerce/screens/users/user_forgot_password.dart';
import 'package:ecommerce/screens/users/persistent_nav_bar.dart';
import 'package:ecommerce/widgets/utilities/support_widgets.dart';
import 'package:ecommerce/screens/admin/admin_login.dart';
import 'package:ecommerce/services/database/database.dart';
import 'package:ecommerce/services/shared_preferences.dart';
import 'package:ecommerce/widgets/utilities/login_signup-button.dart';
import 'package:ecommerce/services/auth/auth_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = AuthServices();
  final supportingWidgets = SupportingWidgets();
  final databaseMethods = Database();
  final sharedPref = SharedPreference();

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isLoadingGoogle = false;
  bool isLoadingFacebook = false;

  // disposing the texteditingcontroller
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: style.color1,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 25),
                // username textfield
                MyTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 12),
                // password textfield
                MyTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  hintText: 'Password',
                  obscureText: true,
                  maxLines: 1,
                ),
                SizedBox(height: 10),
                // forgot password?
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: style.color2,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                // log in button
                isLoading
                    ? SpinKitWave(
                        color: style.color1,
                        duration: Duration(seconds: 5),
                      )
                    : LoginSignUpButtons(
                        onTap: _userLogin,
                        message: "Log in",
                        onLongPress: _adminLogin,
                      ),
                SizedBox(height: 30),
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: style.color2),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    isLoadingGoogle
                        ? SpinKitWave(
                            color: style.color1,
                            duration: Duration(seconds: 5),
                          )
                        : SquareTile(
                            imagePath: 'assets/images/google.png',
                            onTap: _googleSignIn,
                          ),
                    SizedBox(width: 25),
                    // apple button
                    isLoadingFacebook
                        ? SpinKitWave(
                            color: style.color1,
                            duration: Duration(seconds: 5),
                          )
                        : SquareTile(
                            imagePath: "assets/images/facebook.png",
                            onTap: _facebookSignIn,
                          ),
                  ],
                ),
                SizedBox(height: 20),
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => Registration(),
                          ),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: style.color2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // clear values of text editing controller
  void clearTextEditingController() {
    emailController.clear();
    passwordController.clear();
  }

  // Facebook sign in
  void _facebookSignIn() async {
    setState(() {
      isLoadingFacebook = true;
    });

    // perform Facebook sign-in
    final userCredential = await auth.loginWithFacebook();

    // User signed in successfully with Facebook
    if (userCredential != null) {
      // Extract user information
      String userName = userCredential.user!.displayName ?? "";
      String email = userCredential.user!.email ?? "";
      String userImage = userCredential.user!.photoURL ?? "";

      // Create user info map
      Map<String, dynamic> userInfo = {
        "Type": "Facebook",
        "UserName": userName,
        "Email": email,
        "UserImage": userImage,
      };

      // Add user information to Firestore
      await databaseMethods.addUserDetails(userInfo, userCredential.user!.uid);

      // Update state
      setState(() {
        isLoadingFacebook = false;
      });
    } else {
      // Failed to sign in with Facebook
      setState(() {
        isLoadingGoogle = false;
      });
      supportingWidgets.alertSnackBar(
        context,
        "Failed to sign in with Facebook",
      );
    }
  }

  // google sign in
  void _googleSignIn() async {
    setState(() {
      isLoadingGoogle = true;
    });

    // Perform Google sign-in
    final userCredential = await auth.loginWithGoogle();

    // User signed in successfully with Google
    if (userCredential != null) {
      // Extract user information
      String userName = userCredential.user!.displayName ?? "";
      String email = userCredential.user!.email ?? "";
      String userImage = userCredential.user!.photoURL ?? "";

      // Create user info map
      Map<String, dynamic> userInfo = {
        "Type": "Google",
        "UserName": userName,
        "Email": email,
        "UserImage": userImage,
      };

      // Add user information to Firestore
      await databaseMethods.addUserDetails(userInfo, userCredential.user!.uid);

      // Update state
      setState(() {
        isLoadingGoogle = false;
      });
    } else {
      // Failed to sign in with Google
      setState(() {
        isLoadingGoogle = false;
      });
      // ignore: use_build_context_synchronously
      supportingWidgets.alertSnackBar(context, "Failed to sign in with Google");
    }
  }

  // admin sign in 1
  void _adminLogin() async {
    // Check if email is empty
    supportingWidgets.textFieldCantBeEmpty(emailController, context, "Email can't be empty");

    // Check if password is empty
    supportingWidgets.textFieldCantBeEmpty(passwordController, context, "Password can't be empty");

    setState(() {
      isLoading = true;
    });

    // to navigate to admin side
    if (emailController.text == "Admin123@gmail.com" && passwordController.text == "Admin@123") {
      setState(() {
        isLoading = false;
      });
      supportingWidgets.successSnackBar(context, "Redirecting to Admin side");
      // delayed till 1 seconds
      await Future.delayed(Duration(seconds: 1));
      //Removes the current SnackBar.
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // clear the text editing controller values
      clearTextEditingController();
      // navigating to tabs screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => AdminLogin(),
        ),
      );
    }
  }

  // sign user in method
  void _userLogin() async {
    // Check if email is empty
    supportingWidgets.textFieldCantBeEmpty(emailController, context, "Email can't be empty");

    // Check if password is empty
    supportingWidgets.textFieldCantBeEmpty(passwordController, context, "Password can't be empty");

    // Check if email is valid
    supportingWidgets.textFieldEmailValid(emailController, context, "Invalid email formate");

    // Check if password meets minimum length requirement
    supportingWidgets.passwordLength(
        passwordController, context, "Password must be at least 6 characters long");

    setState(() {
      isLoading = true;
    });

    final user = await auth.loginUserWithEmailAndPassword(
      emailController.text.trim(),
      passwordController.text.trim(),
      context,
    );

    if (user != null) {
      setState(() {
        isLoading = false;
      });
      // user have account
      supportingWidgets.successSnackBar(context, "Login Successful");
      // delayed till 1 seconds
      await Future.delayed(Duration(seconds: 1));
      //Removes the current SnackBar.
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // clear the text editing controller values
      clearTextEditingController();
      // navigating to tabs screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Tabs(),
        ),
      );
    } else if (user == null) {
      // user didn't have account
      supportingWidgets.alertSnackBar(context, "User didn't Exits");
      await Future.delayed(Duration(seconds: 2));
      //Removes the current SnackBar.
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // clear the text editing controller values
      emailController.clear();
      passwordController.clear();
    }
  }
}
