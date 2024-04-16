// main files
import 'package:ecommerce/widgets/products/product_display.dart';
import 'package:ecommerce/widgets/title_tile.dart';
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
                // search bar
                CustomSearchBar(),
                style.customSpacing(height: 19.5),
                // Category title
                TitleTile(mainTitle: "Category's", seeAll: () {}),
                style.customSpacing(height: 10.0),
                // Category cards
                CategoryDisplay(
                  category: dummyCategories,
                ),
                style.customSpacing(height: 19.0),
                // Product Title
                TitleTile(mainTitle: "Product's", seeAll: () {}),
                style.customSpacing(height: 10.0),
                // Products cards
                ProductDisplay(
                  product: dummyProducts,
                ),

                style.customSpacing(height: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
