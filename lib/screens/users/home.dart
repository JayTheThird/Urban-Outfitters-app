// main files
import 'package:ecommerce/widgets/supporting_widgets/image_slider.dart';
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/widgets/category/category_display.dart';
import 'package:ecommerce/widgets/supporting_widgets/search_bar.dart';
import 'package:ecommerce/widgets/supporting_widgets/main_header.dart';
import 'package:ecommerce/widgets/products/product_display.dart';
import 'package:ecommerce/widgets/supporting_widgets/title_tile.dart';
import 'package:ecommerce/widgets/category/all_category.dart';
import 'package:ecommerce/screens/users/all_products.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Navigate to see all product when user taps on see all
  void seeAllProducts() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SeeAllProducts(),
      ),
    );
  }

  // Navigate to see all Category when user taps on see all
  void seeAllCategory() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SeeAllCategories(),
      ),
    );
  }

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
                // slider
                HomeImageSlider(),
                style.customSpacing(height: 20.0),
                // search bar
                CustomSearchBar(),
                style.customSpacing(height: 19.5),
                // Category title
                TitleTile(
                  mainTitle: "Category's",
                  seeAll: seeAllCategory,
                ),
                style.customSpacing(height: 10.0),
                // Category cards
                CategoryDisplay(
                  category: dummyCategories,
                ),
                style.customSpacing(height: 19.0),
                // Product Title
                TitleTile(mainTitle: "Product's", seeAll: seeAllProducts),
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
