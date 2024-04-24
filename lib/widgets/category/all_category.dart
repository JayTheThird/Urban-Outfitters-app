// Main Files
import 'package:ecommerce/data/dummy_data.dart';
import 'package:ecommerce/widgets/category/category_tile.dart';
// Project Files
import 'package:flutter/material.dart';

class SeeAllCategories extends StatelessWidget {
  const SeeAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio for grid items
    double calculateAspectRatio(BuildContext context) {
      // Total width available for two grid items
      double availableWidth =
          MediaQuery.of(context).size.width - 20; // 10 padding on each side

      // Width of one grid item
      double singleItemWidth =
          (availableWidth - 4) / 2; // 2 crossAxisSpacing between items

      // Height of one grid item
      double singleItemHeight = 150;

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
        itemCount: dummyCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: calculateAspectRatio(context),
        ),
        itemBuilder: (context, index) {
          return CategoryTile(
            category: dummyCategories[index],
          );
        },
      ),
    );
  }
}
