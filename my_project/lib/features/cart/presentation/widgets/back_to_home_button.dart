import 'package:flutter/material.dart';

class BackToHomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackToHomeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Back to home',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF757575),
        ),
      ),
    );
  }
}
