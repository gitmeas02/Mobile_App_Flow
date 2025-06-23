import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/features/details/presentation/pages/product_detail_page.dart';
import 'package:my_project/features/plant/data/models/plant.dart';
import 'package:my_project/features/cart/presentation/providers/cart_provider.dart';
import 'package:my_project/features/favorite/presentation/providers/favorite_provider.dart';

class PlantCard extends ConsumerWidget {
  final Plant? plant;

  const PlantCard({super.key, this.plant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (plant == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        width: 175,
        height: 270, // Increased height to accommodate content
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: const Center(
          child: Icon(Icons.local_florist, size: 50, color: Color(0xFF53B175)),
        ),
      );
    }

    final isFavorite = ref
        .watch(favoriteProvider)
        .any((p) => p.name == plant!.name);

    return Container(
      padding: const EdgeInsets.all(12), 
      width: 175,
      height: 275, // Increased height to accommodate content
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(plant: plant),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and favorite icon
            Expanded(
              flex: 6, // Adjusted flex ratio
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      plant!.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.local_florist,
                          size: 50,
                          color: Color(0xFF53B175),
                        );
                      },
                    ),
                  ),
                  // Favorite icon positioned at top right
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(favoriteProvider.notifier)
                            .toggleFavorite(plant!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFavorite
                                  ? 'Removed from favorites'
                                  : 'Added to favorites',
                            ),
                            backgroundColor: const Color(0xFF53B175),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 18, 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8), 
            // Plant details
            Expanded(
              flex: 4, // Adjusted flex ratio
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant!.name,
                        style: const TextStyle(
                          fontSize: 14, // Slightly smaller font
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        plant!.description,
                        style: const TextStyle(
                          fontSize: 12, // Smaller font for description
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Price and Add button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          '\$${plant!.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16, // Slightly smaller price font
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 40, // Slightly smaller button
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF53B175),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (plant != null) {
                              ref
                                  .read(cartProvider.notifier)
                                  .addPlantToCart(plant!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${plant!.name} added to cart!',
                                  ),
                                  backgroundColor: const Color(0xFF53B175),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 22,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
