// main files
import 'package:ecommerce/models/products.dart';
// project files
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.products});

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(products.id),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              products.productImage,
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
