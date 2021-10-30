import 'package:flutter/material.dart';

extension StringExts on String {
  Color toColor() {
    const defaultColor = Colors.black;
    if (isNotEmpty && startsWith('#')) {
      final colorString = substring(1);
      String? hexString;
      if (length == 9) hexString = '0x$colorString';
      if (length == 7) hexString = '0xff$colorString';
      if (length == 4) hexString = '0xff$colorString$colorString';
      if (hexString == null) return defaultColor;
      final colorInt = int.tryParse(hexString);
      if (colorInt == null) return defaultColor;
      return Color(colorInt);
    }
    return defaultColor;
  }

  String withApostrophe() {
    final endsWithS = this[length - 1] == 's';
    final apostrophe = endsWithS ? '\'' : '\'s';
    return this + apostrophe;
  }

  Uri? toUri() => Uri.tryParse(this);
}
