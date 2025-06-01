import 'package:flutter/material.dart';
// import 'package:my_project/screens/home_screen.dart';
// import 'package:my_project/screens/first_loading_screen.dart';
import 'package:my_project/theme/theme.dart';
import 'package:my_project/screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lesson 1',
      theme: AppTheme.defaultTheme,
      home: TestScreen(), // FirstLoadingScreen(),
    );
  }
}
