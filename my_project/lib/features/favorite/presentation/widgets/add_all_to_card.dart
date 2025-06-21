import 'package:flutter/material.dart';

class AddAllToCard extends StatelessWidget {
  const AddAllToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.green, // background color
        foregroundColor: Colors.white, // text color
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () {},
      child: const Text("Add All To Card", style: TextStyle(fontSize: 18)),
    );
  }
}
