import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/core/utils/button/titleView.dart';
import 'package:my_project/core/widgets/inputs/custom_search_bar.dart';
import 'package:my_project/features/home/presentation/widgets/carousel_banner.dart';
import 'package:my_project/features/plant/data/models/category_banner.dart';
import 'package:my_project/features/plant/data/models/plant.dart';
import 'package:my_project/features/plant/presentation/widgets/plant_grid_banner.dart';
import 'package:my_project/features/plant/presentation/widgets/plant_grid_card.dart';
import 'package:my_project/features/favorite/presentation/providers/favorite_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchFocused = false;
  List<String> _filteredItems = [];

  final List<String> _searchItems = [
    'Monstera',
    'Snake Plant',
    'Fiddle Leaf Fig',
    'Rubber Plant',
    'Pothos',
    'ZZ Plant',
    'Peace Lily',
    'Spider Plant',
  ];

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onFilterTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Filter feature coming soon!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCount = ref.watch(favoriteCountProvider);

    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/axolotl.png'),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                  Text(
                    'Axolotl',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
              IconButton(
                onPressed: () {
                  // Navigate to favorite page
                  Navigator.pushNamed(context, '/favorite');
                },
                icon:
                    favoriteCount > 0
                        ? Badge(
                          label: Text(favoriteCount.toString()),
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          child: const Icon(Icons.favorite_border),
                        )
                        : const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomSearchBar(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    onFilterTap: _onFilterTap,
                  ),
                  const SizedBox(height: 30),
                  const CarouselBanner(),

                  // Exclusive Offer section
                  Titleview(
                    title: "Exclusive Offer",
                    onSeeAllTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("See all Exclusive Offers"),
                        ),
                      );
                    },
                  ),
                  PlantGridCard(
                    plants: [
                      Plant(
                        name: "Monstera",
                        description: "Indoor plant",
                        price: 24.99,
                        imagePath: "assets/images/plant1.png",
                      ),
                      Plant(
                        name: "Snake Plant",
                        description: "Low maintenance",
                        price: 19.99,
                        imagePath: "assets/images/plant2.png",
                      ),
                      Plant(
                        name: "Snake Plant",
                        description: "Low maintenance",
                        price: 19.99,
                        imagePath: "assets/images/plant2.png",
                      ),
                      Plant(
                        name: "Snake Plant",
                        description: "Low maintenance",
                        price: 19.99,
                        imagePath: "assets/images/plant2.png",
                      ),
                      Plant(
                        name: "Snake Plant",
                        description: "Low maintenance",
                        price: 19.99,
                        imagePath: "assets/images/plant2.png",
                      ),
                      // ... more plants
                    ],
                  ),

                  // Featured Products section
                  Titleview(
                    title: "Best Selling",
                    onSeeAllTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("See all best selling Products"),
                        ),
                      );
                    },
                  ),

                  // Best Selling section
                  PlantGridCard(
                    plants: [
                      Plant(
                        name: "Fiddle Leaf Fig",
                        description: "Statement plant",
                        price: 45.99,
                        imagePath: "assets/images/plant1.png",
                      ),
                      Plant(
                        name: "Rubber Plant",
                        description: "Easy care",
                        price: 32.99,
                        imagePath: "assets/images/plant2.png",
                      ),
                      Plant(
                        name: "Pothos",
                        description: "Trailing vine",
                        price: 18.99,
                        imagePath: "assets/images/plant3.png",
                      ),
                      Plant(
                        name: "ZZ Plant",
                        description: "Low light plant",
                        price: 28.99,
                        imagePath: "assets/images/plant1.png",
                      ),
                    ],
                  ),

                  // Categories section
                  Titleview(
                    title: "Categories",
                    onSeeAllTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("See all Categories")),
                      );
                    },
                  ),
                  PlantGridBanner(
                    banners: [
                      CategoryBanner(
                        name: "Indoor Plants",
                        imagePath: "assets/images/plant1.png",
                        colors: const Color(0xFFFEF8E5),
                      ),
                      CategoryBanner(
                        name: "Flowering Plants",
                        imagePath: "assets/images/plant2.png",
                        colors: const Color.fromARGB(255, 162, 224, 185),
                      ),
                      CategoryBanner(
                        name: "Succulents & Cacti",
                        imagePath: "assets/images/plant3.png",
                        colors: const Color(0xFFF7A593),
                      ),
                      CategoryBanner(
                        name: "Outdoor Plants",
                        imagePath: "assets/images/plant1.png",
                        colors: const Color(0xFFD3B0E0),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  PlantGridCard(
                    plants: [
                      Plant(
                        name: "Fiddle Leaf Fig",
                        description: "Statement plant",
                        price: 45.99,
                        imagePath: "assets/images/plant1.png",
                      ),
                      Plant(
                        name: "Rubber Plant",
                        description: "Easy care",
                        price: 32.99,
                        imagePath: "assets/images/plant2.png",
                      ),
                      Plant(
                        name: "Pothos",
                        description: "Trailing vine",
                        price: 18.99,
                        imagePath: "assets/images/plant3.png",
                      ),
                      Plant(
                        name: "ZZ Plant",
                        description: "Low light plant",
                        price: 28.99,
                        imagePath: "assets/images/plant1.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_isSearchFocused)
              Positioned(
                top: 70,
                left: 16,
                right: 16,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 250),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        _filteredItems.isNotEmpty
                            ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: _filteredItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(_filteredItems[index]),
                                  onTap: () {
                                    setState(() {
                                      _searchController.text =
                                          _filteredItems[index];
                                      _searchFocusNode.unfocus();
                                    });
                                  },
                                );
                              },
                            )
                            : const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text("No result found"),
                            ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
