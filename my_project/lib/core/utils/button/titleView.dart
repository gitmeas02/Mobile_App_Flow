import 'package:flutter/material.dart';

class Titleview extends StatelessWidget {
  final String title;
  final String? seeAllText;
  final VoidCallback? onSeeAllTap;
  final List<Widget>? children;
  final bool showHorizontalList;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleStyle;
  final TextStyle? seeAllStyle;

  const Titleview({
    super.key,
    required this.title,
    this.seeAllText = "See all",
    this.onSeeAllTap,
    this.children,
    this.showHorizontalList = true,
    this.padding,
    this.titleStyle,
    this.seeAllStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row with See All button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    titleStyle ??
                    const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              if (seeAllText != null && onSeeAllTap != null)
                GestureDetector(
                  onTap: onSeeAllTap,
                  child: Text(
                    seeAllText!,
                    style:
                        seeAllStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green.shade600,
                        ),
                  ),
                ),
            ],
          ),

          // Content section
        ],
      ),
    );
  }
}
