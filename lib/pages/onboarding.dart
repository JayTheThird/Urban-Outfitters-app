// main files
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() {
    return _OnBoardingScreen();
  }
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var Height = constraints.maxHeight;
        print("width $width");
        print("Height $Height");
        // vertical height 980, width 411
        // horizontal height 377, width = 862
        return Scaffold(
          backgroundColor: HexColor("ffffff"),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/gif/landingpage.gif"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Urban Outfitter's \nWelcomes You!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 32,
                        color: HexColor("65451F"),
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: HexColor("65451F"),
                  ),
                  child: Text(
                    "NEXT",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: HexColor("ffffff"),
                          letterSpacing: 2,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
