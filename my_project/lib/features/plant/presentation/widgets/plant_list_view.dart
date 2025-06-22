import 'package:flutter/material.dart';
import 'package:my_project/features/plant/data/models/plant.dart';
import 'plant_card.dart';

class PlantListView extends StatelessWidget {
  final List<Plant> plants;
  final ScrollController scrollController;
  final bool isLoading;
  final bool hasMoreData;

  const PlantListView({
    super.key,
    required this.plants,
    required this.scrollController,
    required this.isLoading,
    required this.hasMoreData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: plants.length + (hasMoreData ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == plants.length) {
                return _buildLoadingIndicator();
              }
              return PlantCard(plant: plants[index]);
            },
          ),
        ),
        if (isLoading && plants.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(color: Color(0xFF53B175)),
          ),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(color: Color(0xFF53B175)),
      ),
    );
  }
}
