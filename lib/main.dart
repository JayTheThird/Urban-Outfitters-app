// main files
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// project files
import 'package:ecommerce/pages/home.dart';

void main() {
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
              child: Home(),
            ),
          ),
        );
      },
    );
  }
}
