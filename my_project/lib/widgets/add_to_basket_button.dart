// lib/widgets/add_to_basket_button.dart
import 'package:flutter/material.dart';

class AddToBasketButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToBasketButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF53B175),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Add To Basket',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
