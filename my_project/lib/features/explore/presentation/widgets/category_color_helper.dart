import 'package:flutter/material.dart';
import 'dart:math';

class CategoryColorHelper {
  static final List<Map<String, Color>> _colorSchemes = [
    // Green scheme (Indoor Plants)
    {'background': Color(0xFFF6FFF6), 'border': Color(0xFF7CB342)},
    // Peach scheme (Flowering Plants)
    {'background': Color(0xFFFFF4F0), 'border': Color(0xFFFF8A65)},
    // Pink scheme (Succulents & Cacti)
    {'background': Color(0xFFFFF0F5), 'border': Color(0xFFE91E63)},
    // Purple scheme (Outdoor Plants)
    {'background': Color(0xFFF8F4FF), 'border': Color(0xFF9C27B0)},
    // Yellow scheme (Air-Purifying Plants)
    {'background': Color(0xFFFFFDF0), 'border': Color(0xFFFFC107)},
    // Blue scheme (Herbal Plants)
    {'background': Color(0xFFF0F8FF), 'border': Color(0xFF2196F3)},
  ];

  static Map<String, Color> getRandomColorScheme() {
    final random = Random();
    return _colorSchemes[random.nextInt(_colorSchemes.length)];
  }

  static Map<String, Color> getColorSchemeByIndex(int index) {
    return _colorSchemes[index % _colorSchemes.length];
  }

  static List<Map<String, Color>> getAllColorSchemes() {
    return List.from(_colorSchemes);
  }
}
