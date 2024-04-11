// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/widgets/support_styling_widget.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // created style object of SupportStylingClass
  SupportStylingClass style = SupportStylingClass();
  // get current time
  final hour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    Widget currentTime() {
      if (hour < 12) {
        return Text("Good Morning", style: style.greetingTitle);
      } else if (hour < 18) {
        return Text("Good Afternoon", style: style.greetingTitle);
      } else {
        return Text("Good Night", style: style.greetingTitle);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: style.defaultHorizontalMargin,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "hello, User",
                        style: style.mainTitle,
                      ),
                      currentTime(),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/user.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
