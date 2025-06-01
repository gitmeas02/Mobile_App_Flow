// lib/widgets/expandable_section_widget.dart
import 'package:flutter/material.dart';

class ExpandableSectionWidget extends StatefulWidget {
  final String title;
  final bool isExpanded;
  final Widget? trailing;

  const ExpandableSectionWidget({
    super.key,
    required this.title,
    this.isExpanded = false,
    this.trailing,
  });

  @override
  State<ExpandableSectionWidget> createState() =>
      _ExpandableSectionWidgetState();
}

class _ExpandableSectionWidgetState extends State<ExpandableSectionWidget> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                if (widget.trailing != null) ...[
                  widget.trailing!,
                  const SizedBox(width: 10),
                ],
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
