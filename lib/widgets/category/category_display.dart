// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/widgets/category/category_tile.dart';
import 'package:ecommerce/models/categories.dart';

class CategoryDisplay extends StatelessWidget {
  const CategoryDisplay({super.key, required this.category});

  final List<Categories> category;

  @override
  Widget build(BuildContext context) {
    // for display category using list-view builder
    return SizedBox(
      height: 260,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryTile(
            category: category[index],
          );
        },
      ),
    );
  }
}
