import 'package:flutter/material.dart';
import 'package:my_project/widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
    static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
            Column(
              children: [
                CustomSearchBar(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  onFilterTap: _onFilterTap,
                ),
                const SizedBox(height: 30), // space for overlay list
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Continue more here'),
                ),
              ],
            ),

            if (_isSearchFocused)
              Positioned(
                top: 70, // adjust as needed so list appears below search bar
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
