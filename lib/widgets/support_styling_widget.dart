import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SupportStylingClass {
  // default color palets
  var color1 = HexColor("65451F"); // DarkWood
  var color2 = HexColor("765827"); // Coffee
  var color3 = HexColor("C8AE7D"); // Tan
  var color4 = HexColor("EAC696"); // Beige

  // default Horizontal Margin
  get defaultHorizontalMargin {
    return EdgeInsets.symmetric(horizontal: 8.0);
  }

  // default title
  TextStyle get mainTitle {
    return TextStyle(
      fontSize: 30,
      color: color1,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get greetingTitle {
    return TextStyle(
      color: color2.withOpacity(0.6),
      fontSize: 17,
      letterSpacing: 2,
    );
  }
}
