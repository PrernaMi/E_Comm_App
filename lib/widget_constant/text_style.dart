import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyleConst {
  static TextStyle mTextStyle(
      {double fontSize = 22,
      FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.black}) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}
