// main files
import 'package:flutter/material.dart';

// project files
import 'package:ecommerce/main.dart';

class UrbanOutfittersMainHeader extends StatefulWidget {
  const UrbanOutfittersMainHeader({super.key});

  @override
  State<UrbanOutfittersMainHeader> createState() =>
      UrbanOutfittersMainHeaderState();
}

class UrbanOutfittersMainHeaderState extends State<UrbanOutfittersMainHeader> {
  // get current time
  final hour = DateTime.now().hour;

  // display current time
  Widget currentTime() {
    if (hour < 12) {
      return Text("Good Morning", style: style.subTitle);
    } else if (hour < 16) {
      return Text("Good Afternoon", style: style.subTitle);
    } else if (hour < 19) {
      return Text("Good Evening", style: style.subTitle);
    } else {
      return Text("Good Night", style: style.subTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
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
    );
  }
}
