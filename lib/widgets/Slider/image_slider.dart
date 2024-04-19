// main files
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeImageSlider extends StatefulWidget {
  const HomeImageSlider({super.key});

  // final Function() onTapBanner;

  @override
  State<HomeImageSlider> createState() => _HomeImageSliderState();
}

class _HomeImageSliderState extends State<HomeImageSlider> {
  // Carousel Controller
  final CarouselController carouselController = CarouselController();
  // created list of banner
  List banner = [
    {
      "id": 1,
      "image_path": 'assets/banner/Urban Outfitters Banner 1.png',
    },
    {
      "id": 2,
      "image_path": 'assets/banner/Urban Outfitters Banner 2.png',
    },
    {
      "id": 3,
      "image_path": 'assets/banner/Urban Outfitters Banner 3.png',
    },
  ];

  // current index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () {},
              child: CarouselSlider(
                items: banner
                    .map(
                      (item) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: banner.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
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
    );
  }
}
