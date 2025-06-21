import 'package:flutter/material.dart';

class FilterCheckboxTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterCheckboxTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, // Explicitly set to rectangle
                borderRadius: BorderRadius.circular(
                  8,
                ), // Square with rounded corners
                color:
                    isSelected ? const Color(0xFF53B175) : Colors.transparent,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF53B175)
                          : const Color(0xFFBDBDBD),
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? const Icon(
                        Icons
                            .check_rounded, // or Icons.check_circle for a bold look
                        color: Colors.white,
                        size: 24, // bigger for more emphasis
                      )
                      : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.black : const Color(0xFF666666),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
