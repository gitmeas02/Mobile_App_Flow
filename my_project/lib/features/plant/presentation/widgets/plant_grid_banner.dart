import 'package:flutter/material.dart';
import 'package:my_project/features/plant/data/models/category_banner.dart';
import 'package:my_project/features/plant/presentation/widgets/plant_category_banner.dart';

class PlantGridBanner extends StatelessWidget {
  final List<CategoryBanner>? banners;
  const PlantGridBanner({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: PlantCategoryBanner(banner: banners![index]),
          );
        },
      ),
    );
  }
}
