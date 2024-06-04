import 'package:flutter/material.dart';

class TitleListTiles extends StatelessWidget {
  const TitleListTiles({
    super.key,
    required this.onTapNavigate,
    required this.color,
    required this.title,
  });

  final void Function() onTapNavigate;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapNavigate,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color,
          width: .07,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color.withOpacity(0.9),
          letterSpacing: 1.5,
          fontSize: 18,
        ),
      ),
      trailing: Icon(
        Icons.add,
        color: color,
        size: 30,
      ),
    );
  }
}
