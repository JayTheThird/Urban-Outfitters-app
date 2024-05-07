// main files

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
// project files
import 'package:ecommerce/screens/user_login.dart';
import 'package:ecommerce/widgets/supportingWidgets/support_styling_widget.dart';

// created style object of SupportStylingClass
SupportStylingClass style = SupportStylingClass();

void main() async {
  WidgetsBinding wb = WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyDuNbRcNw1BtGKL9EWD1nMqT7JF6jxEqRc",
            appId: "1:454992340893:android:3b1e04c33a23379a22f174",
            messagingSenderId: "454992340893",
            projectId: "urban-outfitter",
          ),
        )
      : await Firebase.initializeApp();

  // // for native splash
  FlutterNativeSplash.preserve(widgetsBinding: wb);
  await Future.delayed(Duration(seconds: 1));
  FlutterNativeSplash.remove();

  runApp(
    const App(),
  );
}

final theme = ThemeData(
  textTheme: GoogleFonts.ralewayTextTheme(),
);

class App extends StatelessWidget {
  const App({super.key});

  // Firebase
  // Future<void> initializeDefault() async {
  //   // Represents a single Firebase app instance. You can get an instance by calling [Firebase.app()]
  //   FirebaseApp app = await Firebase
  //       .initializeApp(); //The entry point for accessing Firebase.
  //   print('Initialized default app $app');
  // }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print("Orientation $orientation");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Login(),
            ),
          ),
        );
      },
    );
  }
}
