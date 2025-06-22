import 'package:flutter/material.dart';
import 'package:my_project/features/plant/data/models/category_banner.dart';

class PlantCategoryBanner extends StatelessWidget {
  final CategoryBanner banner;
  const PlantCategoryBanner({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    // Calculate available width accounting for margins and spacing
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth =
        screenWidth -
        32 -
        20; // 32 for horizontal margins, 20 for spacing buffer
    final bannerWidth =
        availableWidth * 0.75; // Use 75% of available width, more conservative

    return Container(
      width: bannerWidth.clamp(
        200.0,
        280.0,
      ), // Clamp between reasonable min/max values
      height: 105,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: banner.colors,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            child: Image.asset(
              banner.imagePath,
              width: 80, // Reduced from 105 to prevent overflow
              height: 80, // Reduced from 90 to maintain aspect ratio
              fit: BoxFit.contain,
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              banner.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18, // Reduced from 20 for better fit
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
