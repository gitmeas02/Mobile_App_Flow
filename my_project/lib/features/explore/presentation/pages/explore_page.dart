import 'package:flutter/material.dart';
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
