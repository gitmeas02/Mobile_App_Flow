import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function(String)? onSearchChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    this.onSearchChanged,
    this.hintText = 'Search Store',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
            prefixIcon: const Icon(Icons.search, color: Color(0xFF9E9E9E)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }
}
