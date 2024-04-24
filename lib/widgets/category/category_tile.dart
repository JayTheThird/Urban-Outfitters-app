// main files
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:transparent_image/transparent_image.dart';
// project files
import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/main.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final Categories category;

  get upperCaseCategoryName {
    return category.categoryName[0].toUpperCase() +
        category.categoryName.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: style.color1,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              clipBehavior: Clip.hardEdge,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(category.image),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Gap(10),
            Text(
              upperCaseCategoryName,
              style: style.mainTitle.copyWith(
                fontSize: 18,
                letterSpacing: 1.5,
                color: style.color1.withOpacity(0.9),
              ),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
