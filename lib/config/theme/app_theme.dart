import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFA904C6);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.pink,
  Colors.cyan,
];

class AppTheme{

  final int selectedColor;
  final double titleFontSize;
  final double subtitleFontSize;
  final double paragraphFontSize;
  final double bodyFontSize;

  AppTheme({
    this.selectedColor = 0,
    this.titleFontSize = 30,
    this.subtitleFontSize = 20,
    this.paragraphFontSize = 15,
    this.bodyFontSize = 40,
  }): assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'Invalid color index, must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme(){
    final themeColor = _colorThemes[selectedColor];

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark,
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: subtitleFontSize, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: paragraphFontSize),
        labelLarge: TextStyle(fontSize: bodyFontSize, fontWeight: FontWeight.bold, color: themeColor),
        labelMedium: TextStyle(fontSize: subtitleFontSize, fontWeight: FontWeight.bold, color: themeColor),
        labelSmall: TextStyle(fontSize: paragraphFontSize, color: themeColor),
      ),//Apply dark theme
    );
  }
}