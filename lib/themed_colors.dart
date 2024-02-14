import 'package:flutter/material.dart';

class ThemedColor {
  // These are fallback colors
  static const Color primary = Color(0xFFEE7452);
  static const Color primaryVariant = Color(0xFFC54A2C);
  static const Color secondary = Color(0xFF8CB9BD);
  static const Color background = Color(0xFFE8CCB9);
  static const Color foreground = Color(0xFFFEFBF6);
  static const Color surface = Color(0xFF120E0F);

  static const Map<String, Map<String, Color>> theme = {
    "vintage": {
      "primary": Color(0xFFEE7452),
      "primaryVariant": Color(0xFFC54A2C),
      "secondary": Color(0xFF8CB9BD),
      "background": Color(0xFFE8CCB9),
      "foreground": Color(0xFFFEFBF6),
      "surface": Color(0xFF120E0F)
    }
  };
}
