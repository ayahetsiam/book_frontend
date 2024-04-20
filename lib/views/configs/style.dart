//import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AppStyle {
  //sizes
  static const double iconSize = 12;
  static const double tabSize = 18;
  static const double selectedLabelSize = 20;
  static const double normalTextSize = 16;
  static const double mediumTextSize = 18;
  static const double largTextSize = 24;
  static const double smallTextSize = 12;

  static const FontWeight titleFontWeight = FontWeight.bold;
  static const FontWeight normalTextFontWeight = FontWeight.normal;
  static const TextStyle notImportantTitleTextStyle =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);
  static const TextStyle notImportantBodyTextStyle =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.normal);

  static LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Colors.grey[100]!,
      Colors.grey[400]!,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
