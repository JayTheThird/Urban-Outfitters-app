// main files
import 'package:ecommerce/widgets/support_styling_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
// project files
import 'package:ecommerce/pages/persistent_nav_bar.dart';

// created style object of SupportStylingClass
SupportStylingClass style = SupportStylingClass();

void main() async {
  // for native splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 2));
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
              child: Tabs(),
            ),
          ),
        );
      },
    );
  }
}
