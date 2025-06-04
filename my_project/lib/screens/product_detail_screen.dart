// lib/screens/product_detail_screen.dart
import 'package:flutter/material.dart';
import '../widgets/product_image_widget.dart';
import '../widgets/product_info_widget.dart';
import '../widgets/quantity_selector_widget.dart';
import '../widgets/expandable_section_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/add_to_basket_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isFavorite = false;

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product Image Section
                  const ProductImageWidget(
                    assetImagePaths: [
                      'assets/images/plant1.png',
                      'assets/images/plant2.png',
                      'assets/images/plant3.png',
                    ],
                  ),

                  // Product Details Section
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Product Info and Heart Icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: ProductInfoWidget(
                                title: 'Plant',
                                subtitle: '1 cup, Price',
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
                            const Text(
                              '\$4.99',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // Expandable Sections
                        ExpandableSectionWidget(
                          title: 'Product Detail',
                          isExpanded: false,
                          expandedContent: const Padding(
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

                        const SizedBox(height: 1),

                        ExpandableSectionWidget(
                          title: 'Nutritions',
                          isExpanded: false,
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E2E2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '100g',
                              style: TextStyle(
                                fontSize: 9,
                                color: Color(0xFF3A3A3A),
                              ),
                            ),
                          ),
                          expandedContent: const Padding(
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

                        const SizedBox(height: 1),

                        ExpandableSectionWidget(
                          title: 'Review',
                          isExpanded: false,
                          trailing: const RatingWidget(rating: 5),
                          expandedContent: const Padding(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: AddToBasketButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added $quantity item(s) to basket'),
                    backgroundColor: Colors.green,
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
