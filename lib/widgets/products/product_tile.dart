// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/pages/home.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 300,
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(
          color: style.color1,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              widget.products.productImage,
              height: 200,
              width: 200,
            ),
          ),
          style.customSpacing(height: 10.0),
          Text(
            widget.products.productName,
            style: style.mainTitle.copyWith(
              fontSize: 20,
              letterSpacing: 1.5,
              color: style.color1.withOpacity(0.8),
            ),
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          style.customSpacing(height: 6.0),
          Text(
            '${widget.products.productPrice} Rs',
            style: style.greetingTitle.copyWith(
              fontSize: 18,
              color: style.color1.withOpacity(0.8),
            ),
          ),
          style.customSpacing(height: 20.0),
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
                onPressed: () {},
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
