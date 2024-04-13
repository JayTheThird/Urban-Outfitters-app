// main files
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
// project files
import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/widgets/support_styling_widget.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});

  final Categories category;
  final SupportStylingClass style = SupportStylingClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      // width: 250,
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: style.color1,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(category.Category_Image),
              width: 250,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
