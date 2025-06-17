import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class QuantitySelectorWidget extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final int minQuantity;
  final int? maxQuantity;

  const QuantitySelectorWidget({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
    this.minQuantity = 1,
    this.maxQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (quantity > minQuantity) {
              onQuantityChanged(quantity - 1);
            }
          },
          child: SizedBox(
            width: 45,
            height: 45,
            child: Icon(
              Icons.remove,
              color:
                  quantity > minQuantity
                      ? AppColors.textSecondary
                      : Colors.grey[400],
              size: 30,
            ),
          ),
        ),

        Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.divider),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (maxQuantity == null || quantity < maxQuantity!) {
              onQuantityChanged(quantity + 1);
            }
          },
          child: SizedBox(
            width: 45,
            height: 45,
            child: Icon(
              Icons.add,
              color:
                  (maxQuantity == null || quantity < maxQuantity!)
                      ? AppColors.backgroundColor1
                      : Colors.grey[400],
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
