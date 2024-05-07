// main files
import 'package:ecommerce/screens/persistent_nav_bar.dart';
import 'package:ecommerce/widgets/utilities/support_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/auth/auth_services.dart';

// project file
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/user_login.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';
import 'package:ecommerce/widgets/utilities/app_logo_square_tile.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = AuthServices();

  SupportingWidgets supportingWidgets = SupportingWidgets();

  // text editing controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // disposing the texteditingcontroller
  @override
  void dispose() {
    userNameController.dispose();
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
                SizedBox(height: 20),
                // Welcome to Urban Outfitter's
                Text(
                  "Welcome to Urban Outfitter's",
                  style: TextStyle(
                    color: style.color1,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 25),
                // username textfield
                MyTextField(
                  controller: userNameController,
                  hintText: 'User Name',
                  keyboardType: TextInputType.name,
                  obscureText: false,
                ),
                // SizedBox(height: 12),
                // contact number textfield
                // MyTextField(
                //   controller: contactController,
                //   keyboardType: TextInputType.number,
                //   hintText: 'Contact Number',
                //   obscureText: false,
                // ),
                SizedBox(height: 12),
                // email textfield
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
                SizedBox(height: 12),
                // Registration in button
                GestureDetector(
                  onTap: _userSignUp,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: style.color2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Registration",
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
                SizedBox(height: 15),
                // not a member? Login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: style.color2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  _userSignUp() async {
    // Check if username is empty
    supportingWidgets.textFieldCantBeEmpty(
        userNameController, context, "Username can't be empty");

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

    // Perform user registration if all validations pass
    final user = await _auth.registerUserWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      supportingWidgets.successSnackBar(context, "Registration Successful");
      // delayed till 1 seconds
      await Future.delayed(Duration(seconds: 1));
      //Removes the current SnackBar.
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // clear the text editing controller values
      userNameController.clear();
      emailController.clear();
      passwordController.clear();
      // navigating to tabs screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Tabs(),
        ),
      );
    } else {
      supportingWidgets.alertSnackBar(context, "User already Exits");
      await Future.delayed(Duration(seconds: 2));
      //Removes the current SnackBar.
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // clear the text editing controller values
      userNameController.clear();
      emailController.clear();
      passwordController.clear();
    }
  }
}
