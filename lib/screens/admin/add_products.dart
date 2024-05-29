//  main files
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:firebase_storage/firebase_storage.dart';

//  Project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/widgets/utilities/add_image_to_products_admin.dart';
import 'package:ecommerce/widgets/utilities/buttons.dart';
import 'package:ecommerce/widgets/utilities/single_multi_dropdown.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';
import 'package:random_string/random_string.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  // text editing controllers
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productSizeController = MultiSelectController();

  // list for product size
  final List<ValueItem> _options = [
    ValueItem(label: 'L', value: '1'),
    ValueItem(label: 'M', value: '2'),
    ValueItem(label: 'XL', value: '3'),
    ValueItem(label: 'XXL', value: '4'),
  ];

  // for product images
  File? _selectedProductImage1;
  File? _selectedProductImage2;
  File? _selectedProductImage3;
  File? _selectedProductImage4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: style.color1,
        title: Text(
          "Add Product",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            style.customSpacing(height: 15.0),
            // product name
            _buildTextField("Product Name", _productNameController),
            style.customSpacing(height: 15.0),
            // product price
            _buildTextField("Product Price", _productPriceController),
            style.customSpacing(height: 15.0),
            // product size dropdown
            MultiDropdown(
              hint: "Product Size",
              controller: _productSizeController,
              options: _options,
              selectionType: SelectionType.multi,
              labelColor: Colors.white,
              maxItems: 3,
            ),
            style.customSpacing(height: 15.0),
            // product description
            _buildTextField("Product Description", _productDescriptionController, maxLines: 5),
            style.customSpacing(height: 15.0),
            // product images
            AddProductImageAdmin(
              productImage1: _selectedProductImage1,
              addProductImage1: () => _pickImage((file) => _selectedProductImage1 = file),
              productImage2: _selectedProductImage2,
              addProductImage2: () => _pickImage((file) => _selectedProductImage2 = file),
              productImage3: _selectedProductImage3,
              addProductImage3: () => _pickImage((file) => _selectedProductImage3 = file),
              productImage4: _selectedProductImage4,
              addProductImage4: () => _pickImage((file) => _selectedProductImage4 = file),
            ),
            style.customSpacing(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MainButton1(
                title: "Add",
                colorBG: style.color1,
                onTap: _addProducts,
                width: 340,
              ),
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  // body for textfield
  Widget _buildTextField(String hintText, TextEditingController controller, {int? maxLines}) {
    return MyTextField(
      controller: controller,
      obscureText: false,
      hintText: hintText,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
    );
  }

  // for pick image
  Future<void> _pickImage(
    Function(File) onFilePicked,
  ) async {
    // Returns an XFile object wrapping the image that was picked.
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        onFilePicked(File(pickedImage.path));
      });
    }
  }

  // add products
  void _addProducts() async {
    final productId = randomAlphaNumeric(10);

    // Ensure images are selected
    if (_selectedProductImage1 == null ||
        _selectedProductImage2 == null ||
        _selectedProductImage3 == null ||
        _selectedProductImage4 == null) {
      log('Please select all four images');
      return;
    }

    final storageRef = FirebaseStorage.instance.ref().child("Product images/$productId");

    // Upload images
    final UploadTask imageTask1 = storageRef.child("image1.jpg").putFile(_selectedProductImage1!);
    final UploadTask imageTask2 = storageRef.child("image2.jpg").putFile(_selectedProductImage2!);
    final UploadTask imageTask3 = storageRef.child("image3.jpg").putFile(_selectedProductImage3!);
    final UploadTask imageTask4 = storageRef.child("image4.jpg").putFile(_selectedProductImage4!);

    // Wait for all uploads to complete and get download URLs
    final List<String> imageUrls = await Future.wait([
      imageTask1.then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()),
      imageTask2.then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()),
      imageTask3.then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()),
      imageTask4.then((taskSnapshot) => taskSnapshot.ref.getDownloadURL()),
    ]);

    // Log image URLs
    for (var imageUrl in imageUrls) {
      log(imageUrl);
    }
  }
}
