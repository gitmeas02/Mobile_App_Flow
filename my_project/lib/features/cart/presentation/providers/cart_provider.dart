import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/features/cart/data/model/card_model.dart';
import 'package:my_project/features/plant/data/models/plant.dart';

// Cart provider that manages the list of cart items
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

// Cart total provider that calculates the total price
final cartTotalProvider = Provider<double>((ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.fold(
    0.0,
    (total, item) => total + (item.price * item.capacities),
  );
});

// Cart count provider that returns the total number of items
final cartCountProvider = Provider<int>((ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.fold(0, (total, item) => total + item.capacities);
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super(cartItems); // Initialize with existing cart items

  // Add a plant to the cart
  void addPlantToCart(Plant plant, {int quantity = 1}) {
    // Check if the plant is already in the cart
    final existingIndex = state.indexWhere((item) => item.name == plant.name);

    if (existingIndex != -1) {
      // If plant exists, update the quantity
      final updatedItems = [...state];
      updatedItems[existingIndex] = CartItem(
        price: updatedItems[existingIndex].price,
        name: updatedItems[existingIndex].name,
        descriptions: updatedItems[existingIndex].descriptions,
        image: updatedItems[existingIndex].image,
        capacities: updatedItems[existingIndex].capacities + quantity,
      );
      state = updatedItems;
    } else {
      // If plant doesn't exist, add new item
      final newItem = CartItem(
        price: plant.price,
        name: plant.name,
        descriptions: plant.description,
        image: plant.imagePath,
        capacities: quantity,
      );
      state = [...state, newItem];
    }
  }

  // Remove an item from the cart
  void removeFromCart(String itemName) {
    state = state.where((item) => item.name != itemName).toList();
  }

  // Update item quantity
  void updateQuantity(String itemName, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(itemName);
      return;
    }

    final updatedItems =
        state.map((item) {
          if (item.name == itemName) {
            return CartItem(
              price: item.price,
              name: item.name,
              descriptions: item.descriptions,
              image: item.image,
              capacities: newQuantity,
            );
          }
          return item;
        }).toList();

    state = updatedItems;
  }

  // Clear the entire cart
  void clearCart() {
    state = [];
  }

  // Increment item quantity
  void incrementQuantity(String itemName) {
    final item = state.firstWhere((item) => item.name == itemName);
    updateQuantity(itemName, item.capacities + 1);
  }

  // Decrement item quantity
  void decrementQuantity(String itemName) {
    final item = state.firstWhere((item) => item.name == itemName);
    updateQuantity(itemName, item.capacities - 1);
  }
}
