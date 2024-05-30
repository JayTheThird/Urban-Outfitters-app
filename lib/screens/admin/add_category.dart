import 'dart:io';

import 'package:ecommerce/main.dart';
import 'package:ecommerce/widgets/utilities/buttons.dart';
import 'package:ecommerce/widgets/utilities/image_picker.dart';
import 'package:ecommerce/widgets/utilities/single_multi_dropdown.dart';
import 'package:ecommerce/widgets/utilities/user_textfield.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  // text editing controllers
  final _addNewCategory = TextEditingController();
  final _categoryTypeController = MultiSelectController();

  // list for category type
  final List<ValueItem> _options = [
    ValueItem(label: 'upper-wear', value: '1'),
    ValueItem(label: 'bottom-wear', value: '2'),
  ];

  File? _selectedCategoryImage;

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
                onOptionSelected: (selectedCategoryType) {},
              ),
              style.customSpacing(height: 15.0),
              // add new category
              MyTextField(
                controller: _addNewCategory,
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
                  onTap: () {},
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
}
