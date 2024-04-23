import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.products});

  final Products products;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  // Carousel Controller
  CarouselController carouselController = CarouselController();

  // current index
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: widget.products.productImage
                  .map(
                    (item) => Image.asset(
                      item["image_Path"],
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 1, // to increase and decrease height
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
