import 'package:flutter/material.dart';
import 'package:my_project/features/plant/data/models/plant.dart';


class PlantCard extends StatelessWidget {
  final Plant? plant;

  const PlantCard({
    super.key, 
    this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 175,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plant Image
          Center(child: _buildPlantImage()),
          const SizedBox(height: 12),
          
          // Plant Name
          Text(
            plant?.name ?? 'Name',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          
          // Plant Description
          Text(
            plant?.description ?? 'Description',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
          // Spacer to push price and button to bottom
          const Spacer(),
          
          // Price and Add Button Row - aligned at bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${plant?.price.toStringAsFixed(2) ?? '4.99'}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF53B175),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white, size: 26),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlantImage() {
    final imagePath = plant?.imagePath;

    // Check if it's a network URL
    if (imagePath != null &&
        (imagePath.startsWith('http://') || imagePath.startsWith('https://'))) {
      
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                  strokeWidth: 2,
                  color: const Color(0xFF53B175),
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.local_florist,
                size: 50,
                color: Color(0xFF53B175),
              ),
            );
          },
        ),
      );
    } else {
      // Use asset image
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath ?? 'assets/images/plant.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.local_florist,
                size: 50,
                color: Color(0xFF53B175),
              ),
            );
          },
        ),
      );
    }
  }
}
