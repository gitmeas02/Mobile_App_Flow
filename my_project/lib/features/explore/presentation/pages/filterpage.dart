import 'package:flutter/material.dart';
import 'package:my_project/features/explore/presentation/widgets/filterbutton.dart';
import 'package:my_project/features/explore/presentation/widgets/filtercheckboxtile.dart';
import 'package:my_project/features/explore/presentation/widgets/filterheader.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  Map<String, bool> categoryFilters = {
    'Indoor Plant': false,
    'Flowering Plants': false,
    'Succulents & Cacti': false,
    'Air-Purifying Plants': false,
    'Outdoor Plants': false,
    'Herbal Plants': false,
    'Low Maintenance Plant': false,
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCategory(String category) {
    setState(() {
      categoryFilters[category] = !categoryFilters[category]!;
    });
  }

  void _applyFilters() {
    List<String> selectedCategories =
        categoryFilters.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

    _animationController.reverse().then((_) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Applied filters: ${selectedCategories.join(', ')}'),
          backgroundColor: const Color(0xFF4CAF50),
        ),
      );
    });
  }

  void _closeFilter() {
    _animationController.reverse().then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Background overlay
              GestureDetector(
                onTap: _closeFilter,
                child: AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return Container(
                      color: Colors.black.withAlpha(
                        (0.5 * _fadeAnimation.value * 255).toInt(),
                      ),
                    );
                  },
                ),
              ),
              // Filter content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    MediaQuery.of(context).size.height *
                        0.8 *
                        _slideAnimation.value,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Status bar area
                        Container(
                          height: MediaQuery.of(context).padding.top + 20,
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top,
                          ),
                        ),
                        // Header
                        FilterHeader(onClose: _closeFilter),
                        // Content
                        Expanded(
                          child: Container(
                            color: const Color(0xFFF5F5F5),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: ListView(
                                    children:
                                        categoryFilters.entries.map((entry) {
                                          return FilterCheckboxTile(
                                            title: entry.key,
                                            isSelected: entry.value,
                                            onTap:
                                                () =>
                                                    _toggleCategory(entry.key),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Apply button
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                          color: const Color(0xFFF5F5F5),
                          child: FilterApplyButton(onPressed: _applyFilters),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
