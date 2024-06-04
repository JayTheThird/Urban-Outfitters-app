// main files
import 'dart:io';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductImagesPicker extends StatefulWidget {
  ProductImagesPicker({
    super.key,
    required this.onTapGallery,
    this.selectedImage,
    this.height,
    this.width,
  });

  File? selectedImage;
  final void Function() onTapGallery;
  double? height;
  double? width;

  @override
  State<ProductImagesPicker> createState() => _ProductImagesPickerState();
}

class _ProductImagesPickerState extends State<ProductImagesPicker> {
  // add business logo button for specific mobile
  Widget mobileButtons() {
    return Row(
      children: [
        // NormalButton(
        //   onTap: widget.onTapMobileGallery,
        //   message: "Gallery",
        //   color: Colors.amber,
        //   customWidth: 120,
        // ),
        // OutlinedButtons(
        //   onTap: widget.onTapMobileCamera,
        //   message: "Camera",
        //   textColor: Colors.black,
        //   borderColor: Colors.amber,
        //   customWidth: 120,
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: style.color1,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: widget.selectedImage != null
          ? Stack(
              children: [
                Image.file(
                  widget.selectedImage!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.selectedImage = null;
                      });
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      size: 28,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: widget.onTapGallery,
              child: Center(
                child: Icon(
                  Icons.photo_camera_outlined,
                  size: 30,
                  color: style.color1,
                ),
              ),
            ),
    );
  }
}
