import 'package:flutter/material.dart';
import 'package:my_project/features/cart/data/model/card_model.dart';

class CartWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;

  const CartWidget({
    super.key,
    required this.item,
    this.onIncrement,
    this.onDecrement,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 96.98,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(item.image, width: 56, height: 76),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  item.descriptions,
                  style: const TextStyle(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15.7),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: IconButton(
                        onPressed: onDecrement,
                        icon: const Icon(Icons.remove),
                        color: Colors.grey,
                        iconSize: 24,
                        padding: const EdgeInsets.all(4),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        item.capacities.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15.7),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: IconButton(
                        onPressed: onIncrement,
                        icon: const Icon(Icons.add),
                        color: Colors.green,
                        iconSize: 24,
                        padding: const EdgeInsets.all(2),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onRemove,
                  color: Colors.black,
                  icon: const Icon(Icons.close),
                ),
                Text(
                  "\$${item.price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
