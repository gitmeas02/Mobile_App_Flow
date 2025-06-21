import 'package:flutter/material.dart';

class PlantSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearchChanged;
  final VoidCallback onClearSearch;

  const PlantSearchBar({
    super.key,
    required this.controller,
    required this.onSearchChanged,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onSearchChanged,
              decoration: const InputDecoration(
                hintText: 'Search plants...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          if (controller.text.isNotEmpty)
            GestureDetector(
              onTap: onClearSearch,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.clear, color: Colors.grey, size: 18),
              ),
            ),
        ],
      ),
    );
  }
}
