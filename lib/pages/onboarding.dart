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
    return Scaffold(
      backgroundColor: HexColor("#ECEFE8"),
      body: Container(
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
