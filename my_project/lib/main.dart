
import 'package:flutter/material.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/initial_login_screen.dart';
import 'package:my_project/screens/login_screen.dart';
import 'package:my_project/screens/onboarding_screen.dart';
import 'package:my_project/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const SignUpScreen(),
    );
  }
}
