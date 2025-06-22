import 'package:flutter/material.dart';
import 'package:my_project/features/explore/presentation/widgets/categorywidget.dart';
import 'package:my_project/features/explore/presentation/widgets/category_color_helper.dart';

class CategoriesGridWidget extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final Function(String) onCategoryTap;

  const CategoriesGridWidget({
    Key? key,
    required this.categories,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final cat = categories[index];
            // Get color scheme by index to ensure consistent colors per category
            final colorScheme = CategoryColorHelper.getColorSchemeByIndex(
              index,
            );

            return CategoryWidget(
              title: cat['title'],
              imageUrl: cat['image'],
              backgroundColor: colorScheme['background']!,
              borderColor: colorScheme['border']!,
              width: double.infinity,
              height: double.infinity,
              onTap: () => onCategoryTap(cat['title']),
            );
          },
        ),
      ),
    );
  }
}
