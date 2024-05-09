// main files
import 'package:ecommerce/widgets/utilities/buttons.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/services/auth/auth_services.dart';

// project file
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/user_registration.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';
import 'package:ecommerce/widgets/utilities/app_logo_square_tile.dart';
import 'package:ecommerce/screens/user_forgot_password.dart';
import 'package:ecommerce/screens/persistent_nav_bar.dart';
import 'package:ecommerce/widgets/utilities/support_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = AuthServices();

  final supportingWidgets = SupportingWidgets();

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                LoginSignUpButtons(onTap: _userLogin, message: "Log in"),
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
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/images/google.png'),
                    SizedBox(width: 25),
                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png')
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

  // sign user in method
  void _userLogin() async {
    // Check if email is empty
    supportingWidgets.textFieldCantBeEmpty(
        emailController, context, "Email can't be empty");

    // Check if password is empty
    supportingWidgets.textFieldCantBeEmpty(
        passwordController, context, "Password can't be empty");

    // Check if email is valid
    supportingWidgets.textFieldEmailValid(
        emailController, context, "Invalid email formate");

    // Check if password meets minimum length requirement
    supportingWidgets.passwordLength(passwordController, context,
        "Password must be at least 6 characters long");

    final user = await auth.loginUserWithEmailAndPassword(
      emailController.text.trim(),
      passwordController.text.trim(),
      context,
    );
    if (user != null) {
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
