// main file
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

// project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/widgets/products/product_details/product_details_image_slider.dart';
import 'package:ecommerce/widgets/products/product_details/product_extra_desc.dart';
import 'package:ecommerce/widgets/products/product_details/product_desc.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
              child: Column(
                children: [
                  ProductDescription(products: widget.products),
                  style.customSpacing(height: 10.0),
                  ListTile(
                    leading: Iconify(
                      Bi.box_seam,
                      color: style.color2,
                      size: 24,
                    ),
                    title: Text(
                      "Express delivery might be available",
                      style: style.subTitle.copyWith(
                        letterSpacing: 1.5,
                        fontSize: 18,
                        color: style.color2.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  style.customSpacing(height: 10.0),
                  ProductExtraDescription(products: widget.products),
                  Gap(100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
