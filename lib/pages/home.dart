// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/widgets/support_styling_widget.dart';

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
    // display current time
    Widget currentTime() {
      if (hour < 12) {
        return Text("Good Morning", style: style.greetingTitle);
      } else if (hour < 16) {
        return Text("Good Afternoon", style: style.greetingTitle);
      } else if (hour < 19) {
        return Text("Good Evening", style: style.greetingTitle);
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
                      "assets/images/user2.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
              style.customSpacing(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: style.color2,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  cursorColor: style.color1,
                  style: TextStyle(
                    color: style.color2,
                    decoration: TextDecoration.none,
                    decorationThickness: 0,
                  ),
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: "Search here..",
                    hintStyle: style.greetingTitle
                        .copyWith(fontSize: 20, color: style.color1),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 32.5,
                      color: style.color2,
                    ),
                    // disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
