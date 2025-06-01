
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  const SearchField({super.key, required this.hintText});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      onChanged: (value) {
        // Handle search logic here
      },
    );
  }
}