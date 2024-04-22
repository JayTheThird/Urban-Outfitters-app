// main file
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
// Carousel Controller
  CarouselController carouselController = CarouselController();

  // current index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.products.productName),
      ),
      body: Column(
        children: [
          style.customSpacing(height: 20.0),
          // For Product Image Slider
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
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.products.productImage.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? style.color1
                                  : style.color4),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
