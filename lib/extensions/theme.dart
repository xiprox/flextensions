import 'package:flutter/material.dart';

extension ThemeDataExts on ThemeData {
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;
}
