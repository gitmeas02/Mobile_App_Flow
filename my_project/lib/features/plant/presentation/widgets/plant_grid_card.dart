import 'package:flutter/material.dart';
import 'plant_card.dart';

class PlantGridCard extends StatelessWidget {
  final List<Plant>? plants;
  final int itemCount;
  final double height;

  const PlantGridCard({
    super.key,
    this.plants,
    this.itemCount = 10,
    this.height = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: plants?.length ?? itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: PlantCard(plant: plants?[index]),
          );
        },
      ),
    );
  }
}

// Simple Plant model for demonstration
class Plant {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  const Plant({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
