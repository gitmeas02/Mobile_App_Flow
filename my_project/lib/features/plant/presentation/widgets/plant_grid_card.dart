import 'package:flutter/material.dart';
import 'package:my_project/features/plant/data/models/plant.dart';
import 'plant_card.dart';

class PlantGridCard extends StatelessWidget {
  final List<Plant>? plants;
  final int itemCount;
  final double height;

  const PlantGridCard({
    super.key,
    this.plants,
    this.itemCount = 10,
    this.height =
        280, // Increased from 250 to accommodate PlantCard height of 275
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
