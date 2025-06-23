import 'package:flutter/material.dart';
import 'package:my_project/features/plant/data/models/plant.dart';
import 'package:my_project/features/plant/presentation/widgets/plant_card.dart';

class IndoorPlantGridView extends StatelessWidget {
  final List<Plant>? plants;
  const IndoorPlantGridView({super.key, required this.plants});

  @override
  Widget build(BuildContext context) {
    // Handle empty or null plant list
    if (plants == null || plants!.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_florist_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No indoor plants available',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Check back later for new arrivals',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio:
              0.63, // Adjusted to prevent overflow - calculated as width/height (175/275)
        ),
        itemCount: plants!.length,
        itemBuilder: (context, index) {
          return PlantCard(plant: plants![index]);
        },
      ),
    );
  }
}
