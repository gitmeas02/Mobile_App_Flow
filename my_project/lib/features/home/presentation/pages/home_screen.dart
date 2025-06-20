import 'package:flutter/material.dart';
import 'package:my_project/core/utils/button/titleView.dart';
import 'package:my_project/core/widgets/inputs/custom_search_bar.dart';
import 'package:my_project/features/home/presentation/widgets/carousel_banner.dart';
import 'package:my_project/features/plant/presentation/widgets/plant_grid_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  final List<String> _allItems = [
    "Apple",
    "Banana",
    "Cherry",
    "DragonFruit",
    "Elderberry",
    "Fig",
    "Grape",
  ];

  List<String> _filteredItems = [];
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;

    _searchController.addListener(_filterList);

    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });
    });
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems =
          _allItems
              .where((item) => item.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onFilterTap() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Filter Tapped!")));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // Remove focus from search bar to hide the list
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
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
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
