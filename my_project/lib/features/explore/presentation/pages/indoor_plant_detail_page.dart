import 'package:flutter/material.dart';
import 'package:my_project/features/explore/presentation/widgets/custom_app_bar_widget.dart';
import 'package:my_project/features/explore/presentation/widgets/indoor_plant_grid_view.dart';
import 'package:my_project/features/plant/data/models/plant.dart';

class IndoorPlantDetailPage extends StatelessWidget {
  const IndoorPlantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: CustomAppBarWidget(
        title: 'Indoor Plants',
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share_outlined, color: Color(0xFF2C2C2C)),
            onPressed: () {
              // Handle search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Search feature coming soon!'),
                  backgroundColor: Color(0xFF53B175),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: IndoorPlantGridView(
              plants: [
                Plant(
                  name: "Fiddle Leaf Fig",
                  description: "Statement plant with large leaves",
                  price: 45.99,
                  imagePath: "assets/images/plant1.png",
                ),
                Plant(
                  name: "Rubber Plant",
                  description: "Easy care glossy leaves",
                  price: 32.99,
                  imagePath: "assets/images/plant2.png",
                ),
                Plant(
                  name: "Snake Plant",
                  description: "Low maintenance air purifier",
                  price: 28.99,
                  imagePath: "assets/images/plant3.png",
                ),
                Plant(
                  name: "Pothos",
                  description: "Trailing vine perfect for hanging",
                  price: 18.99,
                  imagePath: "assets/images/plant1.png",
                ),
                Plant(
                  name: "Peace Lily",
                  description: "Beautiful white flowers",
                  price: 24.99,
                  imagePath: "assets/images/plant2.png",
                ),
                Plant(
                  name: "ZZ Plant",
                  description: "Drought tolerant and stylish",
                  price: 35.99,
                  imagePath: "assets/images/plant3.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
