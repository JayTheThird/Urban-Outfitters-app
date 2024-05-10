// main files
import 'package:flutter/material.dart';
// project files
import 'package:ecommerce/main.dart';

class SquareTile extends StatefulWidget {
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  final String imagePath;
  final void Function() onTap;

  @override
  State<SquareTile> createState() => _SquareTileState();
}

class _SquareTileState extends State<SquareTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: style.color2),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.grey[200],
        ),
        child: Image.asset(
          widget.imagePath,
          height: 40,
        ),
      ),
    );
  }
}
