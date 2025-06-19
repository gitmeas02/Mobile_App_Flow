import 'package:flutter/material.dart';
import '../widgets/CategoryWidget.dart';

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

  void _handleCategoryTap(String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$category selected!'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search Store',
                  hintStyle: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF9E9E9E)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),
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
