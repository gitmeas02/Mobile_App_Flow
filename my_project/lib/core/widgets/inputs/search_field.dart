import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const SearchField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
          color: Colors.transparent,
          width: 2.0,
          ),
        ),
      ),
      onChanged:
          onChanged ??
          (value) {
            // Handle search logic here
          },
    );
  }
}
