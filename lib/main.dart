import 'package:flutter/material.dart';
import 'package:age_calculator/config/theme/app_theme.dart';
import 'package:age_calculator/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
          selectedColor: 1,
          titleFontSize: 30,
          subtitleFontSize: 20,
          paragraphFontSize: 15,
          bodyFontSize: 40
      ).theme(),
      home: const HomeScreen()
    );
  }
}
