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
                    imageUrl:
                        'https://images.unsplash.com/photo-1485955900006-10f4d324d411?w=400',
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
                        const ExpandableSectionWidget(
                          title: 'Product Detail',
                          isExpanded: false,
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
                                color: Color.fromARGB(255, 58, 58, 58),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 1),

                        const ExpandableSectionWidget(
                          title: 'Review',
                          isExpanded: false,
                          trailing: RatingWidget(rating: 5),
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
