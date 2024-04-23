// main file

import 'package:ecommerce/widgets/products/product_details/product_desc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/products/product_details/product_details_image_slider.dart';
// project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/products.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.products});

  final Products products;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.products.productName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          style.customSpacing(height: 10.0),
          // For Product Image Slider
          ProductImageSlider(products: widget.products),
          style.customSpacing(height: 10.0),
          // product description
          Container(
            margin: style.defaultHorizontalMargin,
            child: ProductDescription(products: widget.products),
          ),
        ],
      ),
    );
  }
}



    