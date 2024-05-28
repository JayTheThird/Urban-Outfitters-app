//  Main file
import 'dart:io';
import 'package:flutter/material.dart';

// Project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/widgets/utilities/image_picker.dart';

// ignore: must_be_immutable
class AddProductImageAdmin extends StatefulWidget {
  AddProductImageAdmin({
    super.key,
    // product image 1
    required this.productImage1,
    required this.addProductImage1,
    // product image 2
    required this.productImage2,
    required this.addProductImage2,
    // product image 3
    required this.productImage3,
    required this.addProductImage3,
    // product image 4
    required this.productImage4,
    required this.addProductImage4,
  });

  // product image 1
  File? productImage1;
  final void Function() addProductImage1;

  // product image 2
  File? productImage2;
  final void Function() addProductImage2;

  // product image 3
  File? productImage3;
  final void Function() addProductImage3;

  // product image 3
  File? productImage4;
  final void Function() addProductImage4;

  @override
  State<AddProductImageAdmin> createState() => _AddProductImageAdminState();
}

class _AddProductImageAdminState extends State<AddProductImageAdmin> {
  // create a function for image picker to reduce code duplication
  Widget buildImagePicker(File? image, void Function() onTap) {
    return ProductImagesPicker(
      onTapGallery: onTap,
      selectedImage: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: style.color1,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          style.customSpacing(height: 4.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Add Product Images",
              style: TextStyle(
                fontSize: 25,
                color: style.color1,
                letterSpacing: 1.2,
              ),
            ),
          ),
          // style.customSpacing(height: 4.0),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1, // Aspect ratio 1:1 for square items
              children: [
                // product image 1
                buildImagePicker(widget.productImage1, widget.addProductImage1),
                // product image 2
                buildImagePicker(widget.productImage2, widget.addProductImage2),
                // product image 3
                buildImagePicker(widget.productImage3, widget.addProductImage3),
                // product image 4
                buildImagePicker(widget.productImage4, widget.addProductImage4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
