// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/widgets/category/category_display.dart';
import 'package:ecommerce/widgets/search_bar.dart';
import 'package:ecommerce/widgets/main_header.dart';
import 'package:ecommerce/widgets/products/product_display.dart';
import 'package:ecommerce/widgets/title_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: style.defaultHorizontalMargin,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // main header file 
                UrbanOutfittersMainHeader(),
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
