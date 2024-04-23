import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.products});

  final Products products;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        style.customSpacing(height: 10.0),
        Text(
          widget.products.productName,
          style: style.mainTitle.copyWith(
            fontSize: 25,
            letterSpacing: 1.5,
            color: style.color1.withOpacity(0.8),
          ),
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        style.customSpacing(height: 10.0),
        // product available size
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Size",
              style: style.mainTitle.copyWith(
                fontSize: 20,
                letterSpacing: 2,
                color: style.color2.withOpacity(0.8),
              ),
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(18),
            for (final size in widget.products.productSize)
              Container(
                height: 32.5,
                width: 32.5,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: style.color2, width: 0.8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    size,
                    textAlign: TextAlign.center,
                    style: style.greetingTitle.copyWith(
                      fontSize: 20,
                      color: style.color2.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        style.customSpacing(height: 10.0),
        // product price
        Text(
          '${widget.products.productPrice} Rs',
          style: style.greetingTitle.copyWith(
            fontSize: 20,
            color: style.color1.withOpacity(0.8),
          ),
        ),
        style.customSpacing(height: 20.0),
        // buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: style.color1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
              ),
              label: Text(
                "Wishlisted",
                style: style.mainTitle.copyWith(
                  fontSize: 16,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ),
            Gap(10),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: style.color1,
                  width: 0.8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: style.color1,
              ),
              label: Text(
                "Add to Bag",
                style: style.mainTitle.copyWith(
                  fontSize: 16,
                  letterSpacing: 2,
                  // color: style.color1.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
