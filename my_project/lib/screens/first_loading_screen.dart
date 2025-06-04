import 'package:flutter/material.dart';
import 'package:my_project/theme/colors.dart';

class FirstLoadingScreen extends StatefulWidget {
  const FirstLoadingScreen({super.key});
    static route() => MaterialPageRoute(
        builder: (context) => const FirstLoadingScreen(),
      );
     @override
  State<FirstLoadingScreen> createState() => _FirstLoadingScreenState();
}
  class _FirstLoadingScreenState extends State<FirstLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor1,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flow_logo.png',
              width: 130,
              height: 197,
              fit: BoxFit.contain,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Flow',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 9),
                Text(
                  'Your Green\nLifestyle\nStarts Here.',
                  style: TextStyle(fontSize: 14, color: Colors.white70,
                  fontFamily: 'inter',
                  letterSpacing: 5.5, ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  }
