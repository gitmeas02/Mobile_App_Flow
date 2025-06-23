import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/features/cart/presentation/providers/cart_provider.dart';
import 'package:my_project/features/cart/presentation/widgets/cart_widget.dart';
import 'package:my_project/features/cart/presentation/widgets/go_to_checkout_btn.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Cart"),
        actions: [
          if (cartItems.isNotEmpty)
            IconButton(
              onPressed: () {
                ref.read(cartProvider.notifier).clearCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cart cleared!'),
                    backgroundColor: Color(0xFF53B175),
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline),
            ),
        ],
      ),
      body:
          cartItems.isEmpty
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add some plants to get started!',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  return CartWidget(
                    item: cartItems[index],
                    onIncrement: () {
                      ref
                          .read(cartProvider.notifier)
                          .incrementQuantity(cartItems[index].name);
                    },
                    onDecrement: () {
                      ref
                          .read(cartProvider.notifier)
                          .decrementQuantity(cartItems[index].name);
                    },
                    onRemove: () {
                      ref
                          .read(cartProvider.notifier)
                          .removeFromCart(cartItems[index].name);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${cartItems[index].name} removed from cart',
                          ),
                          backgroundColor: const Color(0xFF53B175),
                        ),
                      );
                    },
                  );
                },
              ),
      bottomNavigationBar:
          cartItems.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: GoToCheckoutBtn(total: cartTotal),
              )
              : null,
    );
  }
}
