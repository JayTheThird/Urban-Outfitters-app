// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/main.dart';

class SeeAllProductTile extends StatefulWidget {
  const SeeAllProductTile({
    super.key,
    required this.products,
    required this.onSelectProducts,
  });

  final Products products;
  final void Function(Products products) onSelectProducts;

  @override
  State<SeeAllProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<SeeAllProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: EdgeInsets.all(4),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: style.color1,
      //     width: 0.8,
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product main image
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              // only display main product image
              widget.products.productMainImage,
              fit: BoxFit.cover,
            ),
          ),
          style.customSpacing(height: 8.0),
          // product title
          Text(
            widget.products.productName,
            style: style.mainTitle.copyWith(
              fontSize: 16,
              letterSpacing: 1.5,
              color: style.color1.withOpacity(0.8),
            ),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          style.customSpacing(height: 6.0),
          // product available size
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (final size in widget.products.productSize)
                Container(
                  height: 22.5,
                  width: 22.5,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: style.color2, width: 0.8),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    size,
                    textAlign: TextAlign.center,
                    style: style.subTitle.copyWith(
                      fontSize: 14,
                      color: style.color1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          style.customSpacing(height: 6.0),
          // product price
          Text(
            '${widget.products.productPrice} Rs',
            style: style.subTitle.copyWith(
              fontSize: 18,
              color: style.color1.withOpacity(0.8),
            ),
          ),
          style.customSpacing(height: 5.0),
          // show product details
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: style.color1,
                    width: 0.8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // or
                  // side: MaterialStateProperty.all(
                  //   BorderSide(
                  //     color: style.color1,
                  //     width: 1,
                  //   ),
                  // ),
                ),
                onPressed: () {
                  // navigate to product_details.dart file to view full product
                  widget.onSelectProducts(widget.products);
                },
                child: Text(
                  "VIEW",
                  style: style.mainTitle.copyWith(
                    fontSize: 16,
                    letterSpacing: 2.5,
                    // color: style.color1.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
