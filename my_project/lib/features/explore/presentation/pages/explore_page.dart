import 'package:flutter/material.dart';
import 'package:my_project/core/widgets/inputs/custom_search_bar.dart';
import 'package:my_project/features/explore/presentation/pages/FilterPage.dart';
import 'package:my_project/features/explore/presentation/widgets/categorywidget.dart';
import 'package:my_project/features/explore/presentation/pages/indoor_plant_detail_page.dart';
import 'package:my_project/features/explore/presentation/widgets/custom_app_bar_widget.dart';
import 'package:my_project/features/explore/presentation/widgets/search_widget.dart';
import 'package:my_project/features/explore/presentation/widgets/categories_grid_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Indoor Plants', 'image': 'assets/images/plant.png'},
    {'title': 'Flowering Plants', 'image': 'assets/images/plant1.png'},
    {'title': 'Succulents & Cacti', 'image': 'assets/images/plant2.png'},
    {'title': 'Outdoor Plants', 'image': 'assets/images/plant3.png'},
    {'title': 'Air-Purifying Plants', 'image': 'assets/images/plant.png'},
    {'title': 'Herbal Plants', 'image': 'assets/images/plant.png'},
  ];

  final TextEditingController _searchController = TextEditingController();
  void _handleCategoryTap(String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$category selected!'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IndoorPlantDetailPage()),
    );
  }

  void _openFilterPage() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  void _handleSearch(String query) {
    // Handle search functionality
    if (query.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Searching for: $query'),
          backgroundColor: const Color(0xFF4CAF50),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: const CustomAppBarWidget(title: 'Find Products'),
      body: Column(
        children: [
          // Custom Search Bar with Filter Icon
          CustomSearchBar(
            controller: _searchController,
            onFilterTap: _openFilterPage,
            hintText: 'Search Store',
          ),
          const SizedBox(height: 12),
          // Category Grid
          Expanded(
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
                  return CategoryWidget(
                    title: cat['title'],
                    imageUrl: cat['image'],
                    backgroundColor: cat['bgColor'],
                    borderColor: cat['borderColor'],
                    width: double.infinity,
                    height: double.infinity,
                    onTap: () => _handleCategoryTap(cat['title']),
                  );
                },
              ),
            ),
            // SearchWidget(
            //   onSearchChanged: _handleSearch,
            //   hintText: 'Search Store',
            // ),
            // CategoriesGridWidget(
            //   categories: categories,
            //   onCategoryTap: _handleCategoryTap,
            // ),
          ),

          SearchWidget(
            onSearchChanged: _handleSearch,
            hintText: 'Search Store',
          ),
          CategoriesGridWidget(
            categories: categories,
            onCategoryTap: _handleCategoryTap,
          ),
        ],
      ),
    );
  }
}
