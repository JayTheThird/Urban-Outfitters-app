// main files
import 'package:ecommerce/widgets/auth/auth_services.dart';
import 'package:flutter/material.dart';
// project file
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/user_registration.dart';
import 'package:ecommerce/widgets/supportingWidgets/user_textfield.dart';
import 'package:ecommerce/widgets/supportingWidgets/app_logo_square_tile.dart';
import 'package:ecommerce/screens/user_forgot_password.dart';
import 'package:ecommerce/screens/persistent_nav_bar.dart';
import 'package:ecommerce/widgets/supportingWidgets/validations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = AuthServices();

  SupportingValidation validation = SupportingValidation();

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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Tabs(),
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: _userLogin,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: style.color2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Log In",
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

  // sign user in method
  void _userLogin() async {
    // Check if email is empty
    validation.textFieldCantBeEmpty(
        emailController, context, "Email can't be empty");

    // Check if password is empty
    validation.textFieldCantBeEmpty(
        passwordController, context, "Password can't be empty");

    // Check if email is valid
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email format"),
        ),
      );
      return;
    }

    // Check if password meets minimum length requirement
    validation.passwordLength(passwordController, context,
        "Password must be at least 6 characters long");

    final user = await auth.loginUserWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Tabs(),
        ),
      );
    }
  }
}
