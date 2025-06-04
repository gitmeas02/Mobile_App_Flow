// lib/widgets/product_info_widget.dart
import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProductInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF7C7C7C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
