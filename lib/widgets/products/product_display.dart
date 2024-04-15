// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/widgets/products/product_tile.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({
    super.key,
    required this.product,
  });

  final List<Products> product;

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      // width: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.length,
        itemBuilder: (context, index) {
          return ProductTile(products: widget.product[index]);
        },
      ),
    );
  }
}
