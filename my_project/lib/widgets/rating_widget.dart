// lib/widgets/rating_widget.dart
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final int maxRating;

  const RatingWidget({super.key, required this.rating, this.maxRating = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          Icons.star,
          size: 14,
          color: index < rating ? const Color(0xFFF3603F) : Colors.grey[300],
        );
      }),
    );
  }
}
