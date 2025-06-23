import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/buttons/add_to_basket_button.dart';
import '../../../../core/widgets/common/expandable_section_widget.dart';
import '../../../../core/widgets/common/product_image_widget.dart';
import '../../../../core/widgets/common/product_info_widget.dart';
import '../../../../core/widgets/common/quantity_selector_widget.dart';
import '../../../../core/widgets/common/rating_widget.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../plant/data/models/plant.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final Plant? plant;

  const ProductDetailPage({super.key, this.plant});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  int quantity = 1;
  bool isFavorite = false;

  final List<String> _imagePaths = [
    'assets/images/plant1.png',
    'assets/images/plant2.png',
    'assets/images/plant3.png',
  ];

  // Default plant data when no plant is passed
  late Plant _currentPlant;

  @override
  void initState() {
    super.initState();
    _currentPlant =
        widget.plant ??
        const Plant(
          name: 'Beautiful Plant',
          description: 'A beautiful indoor plant',
          price: 4.99,
          imagePath: 'assets/images/plant1.png',
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache images
    for (final path in _imagePaths) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const RepaintBoundary(
                  child: ProductImageWidget(
                    assetImagePaths: [
                      'assets/images/plant1.png',
                      'assets/images/plant2.png',
                      'assets/images/plant3.png',
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Product Info and Heart Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProductInfoWidget(
                              title: _currentPlant.name,
                              subtitle: _currentPlant.description,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Quantity and Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuantitySelectorWidget(
                            quantity: quantity,
                            onQuantityChanged: (newQuantity) {
                              setState(() {
                                quantity = newQuantity;
                              });
                            },
                          ),
                          Text(
                            '\$${_currentPlant.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Expandable Sections
                      const RepaintBoundary(
                        child: ExpandableSectionWidget(
                          title: 'Product Detail',
                          isExpanded: false,
                          expandedContent: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'This is a beautiful plant that thrives indoors and purifies the air. Water it regularly.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 1),

                      const RepaintBoundary(
                        child: ExpandableSectionWidget(
                          title: 'Nutritions',
                          isExpanded: false,
                          trailing: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFE2E2E2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              child: Text(
                                '100g',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFF3A3A3A),
                                ),
                              ),
                            ),
                          ),
                          expandedContent: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Calories: 30\nProtein: 1g\nCarbs: 6g\nFat: 0g',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 1),

                      const RepaintBoundary(
                        child: ExpandableSectionWidget(
                          title: 'Review',
                          isExpanded: false,
                          trailing: RatingWidget(rating: 5),
                          expandedContent: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Excellent plant! Looks just like the picture and is very healthy.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: AddToBasketButton(
              onPressed: () {
                // Add plant to cart with selected quantity
                ref
                    .read(cartProvider.notifier)
                    .addPlantToCart(_currentPlant, quantity: quantity);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added $quantity ${_currentPlant.name}(s) to cart',
                    ),
                    backgroundColor: const Color(0xFF53B175),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
