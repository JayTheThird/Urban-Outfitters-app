//  Main Files
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:random_string/random_string.dart';

// Project Files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/services/database/database.dart';
import 'package:ecommerce/widgets/utilities/buttons.dart';
import 'package:ecommerce/widgets/utilities/image_picker.dart';
import 'package:ecommerce/widgets/utilities/single_multi_dropdown.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  // created object to access method of database
  final db = Database();

  // text editing controllers
  final _categoryName = TextEditingController();
  final _categoryTypeController = MultiSelectController();

  // when admin submit form that time display date
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd / HH:mm:ss'); //date and time format

  // list for category type
  final List<ValueItem> _options = [
    ValueItem(label: 'upper-wear', value: '1'),
    ValueItem(label: 'bottom-wear', value: '2'),
  ];

  File? _selectedCategoryImage;

  List<ValueItem> selectedCategoryType = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: style.color1,
        title: Text(
          "Add Category",
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
              // Category Type
              MultiDropdown(
                hint: "Category Type",
                controller: _categoryTypeController,
                options: _options,
                selectionType: SelectionType.single,
                selectedOptionTextColor: style.color1,
                labelColor: Colors.white,
                onOptionSelected: (categoryType) {
                  setState(() {
                    selectedCategoryType = categoryType.toList();
                  });
                  debugPrint("SELECTED CATEGORY TYPE $selectedCategoryType");
                },
              ),
              style.customSpacing(height: 15.0),
              // add new category
              MyTextField(
                controller: _categoryName,
                hintText: "Add New Category",
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              style.customSpacing(height: 15.0),
              // add category image
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 200,
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
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // style.customSpacing(height: 1.0),
                    Text(
                      "Category Image",
                      style: TextStyle(
                        color: style.color1,
                        letterSpacing: 1.5,
                        fontSize: 20,
                      ),
                    ),
                    style.customSpacing(height: 10.0),
                    ProductImagesPicker(
                      onTapGallery: () => _pickImage((file) => _selectedCategoryImage = file),
                      selectedImage: _selectedCategoryImage,
                      height: 150,
                      width: 320,
                    ),
                  ],
                ),
              ),
              style.customSpacing(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MainButton1(
                  title: "Add Category",
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
      () => _addCategories(),
    );
    // Whether this State object is currently in a tree.
    if (!mounted) return;
    context.loaderOverlay.hide();
  }

  void _addCategories() async {
    // Generate a random id for the category
    String categoryId = randomAlphaNumeric(10);

    // Get the current date
    String currentDate = formatter.format(now);

    // Reference to the storage location
    final storageRef = FirebaseStorage.instance.ref().child("category_images/$categoryId");

    // Upload the image
    final UploadTask imageTask = storageRef.child("category-image.jpg").putFile(_selectedCategoryImage!);

    // Wait for the upload to complete and get the download URL
    final TaskSnapshot snapshot = await imageTask;
    final String downloadURL = await snapshot.ref.getDownloadURL();

    // Convert the selected category types to a list of strings
    List<String> selectedTypeOfCategory = selectedCategoryType.map((item) => item.label).toList();

    // Create a map of the category info
    Map<String, dynamic> categoryInfo = {
      "Date-Time": currentDate,
      "Category-Id": categoryId,
      "Category-Type": selectedTypeOfCategory.single,
      "Category-Name": _categoryName.text,
      "Category-Image": downloadURL,
    };

    // Store the category info in Firestore
    await db.addCategory(categoryInfo, categoryId);

    // Clear the form
    _clearForm();
  }

  void _clearForm() {
    _categoryName.clear();
    _categoryTypeController.clearAllSelection();
    setState(() {
      _selectedCategoryImage = null;
    });
  }
}
