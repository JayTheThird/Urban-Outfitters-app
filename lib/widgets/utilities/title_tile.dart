// main files
import 'package:flutter/material.dart';
// Project files
import 'package:ecommerce/main.dart';

class TitleTile extends StatefulWidget {
  const TitleTile({
    super.key,
    required this.mainTitle,
    required this.seeAll,
  });

  final String mainTitle;
  final void Function() seeAll;

  @override
  State<TitleTile> createState() => _TitleTileState();
}

class _TitleTileState extends State<TitleTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.mainTitle,
          style: style.mainTitle.copyWith(
            fontSize: 20,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          customBorder: Border.all(
            color: style.color2,
            width: 0.8,
          ),
          onTap: widget.seeAll,
          child: Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "See all",
              style: style.subTitle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
