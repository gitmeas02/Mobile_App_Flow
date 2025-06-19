import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const CategoryWidget({
    Key? key,
    required this.title,
    this.imageUrl = 'assets/images/plant.png',
    this.backgroundColor = const Color(0xFFE8F5E8), // Light green
    this.borderColor = const Color(0xFFB8E6B8), // Soft green border
    this.width = 160,
    this.height = 180,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Plant image container
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.local_florist,
                      size: 60,
                      color: Color(0xFF4CAF50),
                    );
                  },
                ),
              ),
            ),

            // Title text
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
