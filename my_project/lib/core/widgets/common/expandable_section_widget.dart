import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ExpandableSectionWidget extends StatefulWidget {
  final String title;
  final bool isExpanded;
  final Widget? trailing;
  final Widget? expandedContent;
  final VoidCallback? onToggle;

  const ExpandableSectionWidget({
    super.key,
    required this.title,
    this.isExpanded = false,
    this.trailing,
    this.expandedContent,
    this.onToggle,
  });

  @override
  State<ExpandableSectionWidget> createState() =>
      _ExpandableSectionWidgetState();
}

class _ExpandableSectionWidgetState extends State<ExpandableSectionWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    widget.onToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.divider, height: 1),
        GestureDetector(
          onTap: _toggleExpanded,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                if (widget.trailing != null) widget.trailing!,
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild:
              widget.expandedContent ?? const Text('No content available.'),
          crossFadeState:
              _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
