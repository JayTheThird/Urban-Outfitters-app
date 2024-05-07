// main files
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
// project files
import 'package:ecommerce/screens/user_login.dart';
import 'package:ecommerce/widgets/utilities/support_styling_widget.dart';

// created style object of SupportStylingClass
SupportStylingClass style = SupportStylingClass();

void main() async {
  WidgetsBinding wb = WidgetsFlutterBinding.ensureInitialized();

  // firebase
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

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyC0NAIt0LOZieFZ2Fx-Q34R_WpxNhzdX0c",
        authDomain: "urban-outfitter.firebaseapp.com",
        projectId: "urban-outfitter",
        storageBucket: "urban-outfitter.appspot.com",
        messagingSenderId: "454992340893",
        appId: "1:454992340893:web:c7cab175e8f2693022f174",
      ),
    );
  }

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
