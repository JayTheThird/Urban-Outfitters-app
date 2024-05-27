// main files
import 'package:ecommerce/screens/product_details.dart';
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
  // navigate to product_details.dart file to view full product
  void onSelectedProducts(Products products) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ProductDetails(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      // width: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.length,
        itemBuilder: (context, index) {
          return ProductTile(
            products: widget.product[index],
            // when user tap on view then product display screen will display
            onSelectProducts: onSelectedProducts,
          );
        },
      ),
    );
  }
}
