// lib/widgets/quantity_selector_widget.dart
import 'package:flutter/material.dart';

class QuantitySelectorWidget extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelectorWidget({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (quantity > 1) {
              onQuantityChanged(quantity - 1);
            }
          },
          child: SizedBox(
            width: 45,
            height: 45,
            // decoration: BoxDecoration(
            //   border: Border.all(color: const Color(0xFFE2E2E2)),
            //   borderRadius: BorderRadius.circular(17),
            // ),
            child: Icon(
              Icons.remove,
              color:
                  quantity > 1
                      ? const Color.fromARGB(255, 153, 153, 153)
                      : const Color(0xFFB3B3B3),
              size: 30,
            ),
          ),
        ),

        Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 185, 185, 185)),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            onQuantityChanged(quantity + 1);
          },
          child: SizedBox(
            width: 45,
            height: 45,
            // decoration: BoxDecoration(
            //   border: Border.all(color: const Color(0xFFE2E2E2)),
            //   borderRadius: BorderRadius.circular(17),
            // ),
            child: const Icon(Icons.add, color: Color(0xFF53B175), size: 30),
          ),
        ),
      ],
    );
  }
}
