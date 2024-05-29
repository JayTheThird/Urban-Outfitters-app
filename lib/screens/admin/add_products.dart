//  main files
import 'dart:io';
import 'package:ecommerce/services/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
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
  //
  final db = Database();

  // when user submit form that time display date
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd / HH:mm:ss'); //date and time format

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

  List<ValueItem> selectedSize = [];

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LoaderOverlay(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              style.customSpacing(height: 15.0),
              // product name
              _buildTextField(
                "Product Name",
                _productNameController,
                TextInputType.name,
              ),
              style.customSpacing(height: 15.0),
              // product price
              _buildTextField(
                "Product Price",
                _productPriceController,
                TextInputType.number,
              ),
              style.customSpacing(height: 15.0),
              // product size dropdown
              MultiDropdown(
                hint: "Product Size",
                controller: _productSizeController,
                options: _options,
                selectionType: SelectionType.multi,
                labelColor: Colors.white,
                maxItems: 3,
                onOptionSelected: (selectedOption) {
                  setState(() {
                    // when admin select size it will add in [selectedSize]
                    selectedSize = selectedOption.toList();
                  });
                  debugPrint("SELECTED SIZE $selectedSize");
                },
              ),

              style.customSpacing(height: 15.0),
              // product description
              _buildTextField(
                "Product Description",
                _productDescriptionController,
                TextInputType.name,
                maxLines: 5,
              ),
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
                  onTap: _onTapShowOverlay,
                  width: 340,
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  // body for textfield
  Widget _buildTextField(
    String hintText,
    TextEditingController controller,
    TextInputType typeOfKeyboard, {
    int? maxLines,
  }) {
    return MyTextField(
      controller: controller,
      obscureText: false,
      hintText: hintText,
      keyboardType: typeOfKeyboard,
      maxLines: maxLines,
    );
  }

  void _onTapShowOverlay() async {
    // when admin press button then it will display
    context.loaderOverlay.show(
      widgetBuilder: (_) {
        return Center(
          child: SpinKitWave(
            color: style.color1,
            size: 60,
          ),
        );
      },
    );

    await Future.delayed(
      const Duration(seconds: 3),
      // add products
      () => _addProducts(),
    );
    // Whether this State object is currently in a tree.
    if (!mounted) return;
    context.loaderOverlay.hide();
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
    // unique 10 digit string, work as id for product and image
    final productId = randomAlphaNumeric(10);

    // to show current date
    String currentDate = formatter.format(now);

    // create reference for storage to access
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

    // then it will convert to list of string
    List<String> selectedProductSize = selectedSize
        .map(
          (item) => item.label,
        )
        .toList();

    // adding data
    Map<String, dynamic> productDetails = {
      "Date-Time": currentDate,
      "Product-Id": productId,
      "Image-Id": productId,
      "Product-Name": _productNameController.text,
      "Product-Price": _productPriceController.text,
      "Product-Description": _productDescriptionController.text,
      "Product-Size": selectedProductSize,
      "Images": {
        "image-1": imageUrls[0],
        "image-2": imageUrls[1],
        "image-3": imageUrls[2],
        "image-4": imageUrls[3],
      },
    };

    // addProduct
    db.addProducts(productDetails, productId);

    // when data is send successfully then this function clear form and images
    _clearForm();
  }

  void _clearForm() {
    _productNameController.clear();
    _productPriceController.clear();
    _productDescriptionController.clear();
    _productSizeController.clearAllSelection();
    setState(() {
      _selectedProductImage1 = null;
      _selectedProductImage2 = null;
      _selectedProductImage3 = null;
      _selectedProductImage4 = null;
    });
  }
}
