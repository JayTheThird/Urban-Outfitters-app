// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/widgets/support_styling_widget.dart';
import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/widgets/category/category_display.dart';
import 'package:ecommerce/widgets/search_bar.dart';

// created style object of SupportStylingClass
SupportStylingClass style = SupportStylingClass();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                // header section, where it will show user name, greeting message and icon
                Row(
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
                ),
                style.customSpacing(height: 20.0),
                // for search bar
                CustomSearchBar(),
                style.customSpacing(height: 19.5),
                // Category title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Category's",
                      style: style.mainTitle.copyWith(
                        fontSize: 20,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      customBorder: Border.all(
                        color: style.color2,
                        width: 0.8,
                      ),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "See all",
                          style: style.greetingTitle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                style.customSpacing(height: 10.0),
                // Category cards
                CategoryDisplay(
                  category: dummyCategories,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
