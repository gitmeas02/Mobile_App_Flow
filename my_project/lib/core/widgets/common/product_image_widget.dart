import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ProductImageWidget extends StatefulWidget {
  final List<String> assetImagePaths;

  const ProductImageWidget({super.key, required this.assetImagePaths});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Image Carousel
          PageView.builder(
            controller: _controller,
            itemCount: widget.assetImagePaths.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset(
                    widget.assetImagePaths[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),

          // Page Indicator Dots
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.assetImagePaths.length, (index) {
                bool isActive = index == _currentPage;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 8 : 6,
                  height: isActive ? 8 : 6,
                  decoration: BoxDecoration(
                    color:
                        isActive
                            ? AppColors.backgroundColor1
                            : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
