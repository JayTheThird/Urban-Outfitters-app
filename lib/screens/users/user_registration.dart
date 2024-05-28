// main files
import 'package:ecommerce/screens/users/persistent_nav_bar.dart';
import 'package:ecommerce/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:random_string/random_string.dart';

// project file
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/users/user_login.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';
import 'package:ecommerce/services/database/database.dart';
import 'package:ecommerce/services/auth/auth_services.dart';
import 'package:ecommerce/widgets/utilities/support_widgets.dart';
import 'package:ecommerce/widgets/utilities/login_signup-button.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = AuthServices();
  final supportingWidgets = SupportingWidgets();
  final databaseMethods = Database();
  final sharedPref = SharedPreference();

  bool isLoading = false;

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
                isLoading
                    ? SpinKitWave(
                        color: style.color1,
                        duration: Duration(seconds: 5),
                      )
                    : LoginSignUpButtons(
                        onTap: _userSignUp,
                        message: "Sign up",
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Text(
                //           'Or continue with',
                //           style: TextStyle(color: style.color2),
                //         ),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 20),
                // // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     // google button
                //     // SquareTile(imagePath: 'assets/images/google.png'),
                //     SizedBox(width: 25),
                //     // apple button
                //     // SquareTile(imagePath: 'assets/images/apple.png')
                //   ],
                // ),
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
    emailController.clear();
    passwordController.clear();
  }

  _userSignUp() async {
    String id = randomAlphaNumeric(10);
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

    setState(() {
      isLoading = true;
    });

    // Perform user registration if all validations pass
    final user = await _auth.registerUserWithEmailAndPassword(
        emailController.text, passwordController.text, context);
    if (user != null) {
      setState(() {
        isLoading = false;
      });

      supportingWidgets.successSnackBar(context, "Registration Successful");

      // Storing user data locally
      await sharedPref.saveUserId(id);
      await sharedPref.saveUserName(userNameController.text);
      await sharedPref.saveUserEmail(emailController.text);
      await sharedPref.saveUserImage("ecommerce/assets/images/user2.png");

      // sending user info to firestore
      Map<String, dynamic> userInfo = {
        "Id": id,
        "Type" : "Urban-outfitter",
        "UserName": userNameController.text.trim(),
        "Email": emailController.text.trim(),
        "UserImage": "ecommerce/assets/images/user2.png",
      };
      // add data to users in firestore
      await databaseMethods.addUserDetails(userInfo, id);

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
    } else {
      setState(() {
        isLoading = false;
      });
      supportingWidgets.alertSnackBar(context, "User already Exits");
      await Future.delayed(Duration(seconds: 2));

      //Removes the current SnackBar.
      ScaffoldMessenger.of(context).removeCurrentSnackBar();

      // clear the text editing controller values
      clearTextEditingController();
    }
  }
}
