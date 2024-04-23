import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductExtraDescription extends StatelessWidget {
  const ProductExtraDescription({super.key, required this.products});

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: style.color2, width: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fabric",
                    style: style.mainTitle.copyWith(
                      fontSize: 20,
                      letterSpacing: 2.5,
                    ),
                  ),
                  Text(
                    products.productFabric,
                    style: style.subTitle.copyWith(
                      color: style.color1.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              Gap(70),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transparency",
                    style: style.mainTitle.copyWith(
                      fontSize: 20,
                      letterSpacing: 2.5,
                    ),
                  ),
                  Text(
                    "Opaque",
                    style: style.subTitle.copyWith(
                      color: style.color1.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(20),
          Text(
            "Product Details",
            style: style.mainTitle.copyWith(
              fontSize: 20,
              letterSpacing: 2.5,
            ),
          ),
          Text(
            products.productDetails,
            style: style.subTitle.copyWith(
              color: style.color1.withOpacity(0.6),
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
