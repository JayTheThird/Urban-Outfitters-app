// Main Files
import 'package:flutter/material.dart';
// Product Files
import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/screens/product_details.dart';
import 'package:ecommerce/widgets/products/see_all_product_tile.dart';

class SeeAllProducts extends StatelessWidget {
  const SeeAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // navigate to product_details.dart file to view full product
    void onSelectedProducts(Products products) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ProductDetails(products: products),
        ),
      );
    }

    // Calculate aspect ratio for grid items
    double calculateAspectRatio(BuildContext context) {
      // Total width available for two grid items
      double availableWidth = MediaQuery.of(context).size.width - 20; // 10 padding on each side

      // Width of one grid item
      double singleItemWidth = (availableWidth - 4) / 2; // 2 crossAxisSpacing between items

      // Height of one grid item
      double singleItemHeight = 335;

      // Calculate aspect ratio
      return singleItemWidth / singleItemHeight;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(4),
        itemCount: dummyProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: calculateAspectRatio(context),
        ),
        itemBuilder: (context, index) {
          return SeeAllProductTile(
            products: dummyProducts[index],
            // when user tap on view then product display screen will display
            onSelectProducts: onSelectedProducts,
          );
        },
      ),
    );
  }
}
