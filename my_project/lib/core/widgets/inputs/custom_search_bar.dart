import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback onFilterTap;
  final VoidCallback? onSearchSubmitted;
  final String? hintText;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    this.focusNode,
    required this.onFilterTap,
    this.onSearchSubmitted,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              style: const TextStyle(color: Colors.black), // Make text black
              onSubmitted: (value) {
                if (onSearchSubmitted != null) {
                  onSearchSubmitted!();
                }
              },
              decoration: InputDecoration(
                hintText: hintText ?? 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onFilterTap,
            icon: Icon(Icons.tune, color: AppColors.backgroundColor1),
          ),
        ],
      ),
    );
  }
}
