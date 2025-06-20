import 'package:flutter/material.dart';
import 'package:my_project/features/explore/presentation/pages/FilterPage.dart';
import 'package:my_project/features/explore/presentation/widgets/categorywidget.dart';
import 'package:my_project/core/widgets/inputs/custom_search_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
    {
      'title': 'Indoor Plants',
      'image': 'assets/images/plant.png',
      'borderColor': Color(0xFF7CB342),
      'bgColor': Color(0xFFF6FFF6),
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  void _handleCategoryTap(String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$category selected!'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Find Products',
          style: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(Icons.arrow_back_ios, color: Color(0xFF2C2C2C)),
      ),
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
          ),
        ],
      ),
    );
  }
}
