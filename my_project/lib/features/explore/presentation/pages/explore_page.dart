import 'package:flutter/material.dart';
import 'package:my_project/core/widgets/inputs/custom_search_bar.dart';
import 'package:my_project/features/explore/presentation/pages/filterpage.dart';
import 'package:my_project/features/explore/presentation/pages/indoor_plant_detail_page.dart';
import 'package:my_project/features/explore/presentation/widgets/custom_app_bar_widget.dart';
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
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Remove the automatic listener that triggers on every keystroke
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

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

  void _handleSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty && query.length >= 2) {
      // Implement actual search logic here
      print('Searching for: $query');

      // You can add navigation to search results page here
      // or filter the categories based on the search query
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
            focusNode: _searchFocusNode,
            onFilterTap: _openFilterPage,
            onSearchSubmitted: _handleSearch,
            hintText: 'Search Store',
          ),
          const SizedBox(height: 12),
          // Category Grid
          CategoriesGridWidget(
            categories: categories,
            onCategoryTap: _handleCategoryTap,
          ),
        ],
      ),
    );
  }
}
