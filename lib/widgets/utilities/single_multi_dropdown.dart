import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

// ignore: must_be_immutable
class MultiDropdown extends StatefulWidget {
  MultiDropdown({
    super.key,
    required this.hint,
    required this.controller,
    required this.options,
    this.maxItems,
    required this.selectionType,
    required this.labelColor,
  });

  final String hint;
  final MultiSelectController controller;
  final List<ValueItem<dynamic>> options;
  int? maxItems;
  final SelectionType selectionType;
  final Color labelColor;

  @override
  State<MultiDropdown> createState() => _MultiDropdownState();
}

class _MultiDropdownState extends State<MultiDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MultiSelectDropDown(
        hint: widget.hint,
        controller: widget.controller,
        onOptionSelected: (options) {
          debugPrint(options.toString());
        },
        options: widget.options,
        maxItems: widget.maxItems,
        // disabledOptions: const [ValueItem(label: 'L', value: '1')],
        selectionType: widget.selectionType,
        clearIcon: null,
        chipConfig: ChipConfig(
          wrapType: WrapType.scroll,
          labelColor: widget.labelColor,
          backgroundColor: style.color1,
          radius: 10,
          spacing: 4,
          labelPadding: EdgeInsets.symmetric(horizontal: 6),
        ),
        dropdownHeight: 150,
        optionTextStyle: TextStyle(
          fontSize: 18,
          color: style.color1,
        ),
        selectedOptionIcon: Icon(
          Icons.check_circle_outline,
          color: style.color1,
        ),
        hintStyle: TextStyle(
          fontSize: 18,
          letterSpacing: 2,
          color: style.color2,
        ),
        borderColor: style.color1,
        borderWidth: 1,
        borderRadius: 10,
      ),
    );
  }
}
