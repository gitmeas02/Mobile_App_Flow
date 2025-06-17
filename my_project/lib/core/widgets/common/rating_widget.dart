import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double size;
  final Color? activeColor;
  final Color? inactiveColor;

  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 14,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          Icons.star,
          size: size,
          color:
              index < rating
                  ? (activeColor ?? const Color(0xFFF3603F))
                  : (inactiveColor ?? Colors.grey[300]),
        );
      }),
    );
  }
}
