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

class ThemeProvider extends ChangeNotifier {
  int _selectedColor = 0;
  final double _titleFontSize = 30;
  final double _subtitleFontSize = 20;
  final double _paragraphFontSize = 15;
  final double _bodyFontSize = 30;
  bool _isDarkMode = true;

  int get selectedColor => _selectedColor;
  double get titleFontSize => _titleFontSize;
  double get subtitleFontSize => _subtitleFontSize;
  double get paragraphFontSize => _paragraphFontSize;
  double get bodyFontSize => _bodyFontSize;
  bool get isDarkMode => _isDarkMode;
  List<Color> get colorThemes => _colorThemes;

  ThemeData getTheme(){
    final themeColor = _colorThemes[selectedColor];

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: themeColor,
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: _titleFontSize, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: _subtitleFontSize, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: _paragraphFontSize),
        labelLarge: TextStyle(fontSize: _bodyFontSize, fontWeight: FontWeight.bold, color: themeColor),
        labelMedium: TextStyle(fontSize: _subtitleFontSize, fontWeight: FontWeight.bold, color: themeColor),
        labelSmall: TextStyle(fontSize: _paragraphFontSize, color: themeColor),
      ),//Apply dark theme
    );
  }

  void updateTheme(int colorIndex, bool isDarkMode){
    _selectedColor = colorIndex;
    _isDarkMode = isDarkMode;
    notifyListeners();
  }
}